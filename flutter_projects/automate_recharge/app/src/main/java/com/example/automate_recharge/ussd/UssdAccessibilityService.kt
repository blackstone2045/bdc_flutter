package com.example.automate_recharge

import android.accessibilityservice.AccessibilityService
import android.os.Bundle
import android.util.Log
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityNodeInfo
import com.example.automate_recharge.ussd.UssdSessionManager
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class UssdAccessibilityService : AccessibilityService() {

    private val scope = CoroutineScope(Dispatchers.Main)

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        if (!UssdSessionManager.isActive) return
        if (event == null) return

        val root = rootInActiveWindow ?: return
        val allText = extractAllText(root).lowercase()

        // Common USSD dialog detection
        if (allText.contains("ussd") || allText.contains("continue") ||
            allText.contains("enter") || allText.contains("amount") ||
            allText.contains("confirm") || allText.contains("option") ||
            allText.contains("menu") || allText.contains("reply")) {

            Log.d("USSD", "Detected dialog: $allText")
            UssdSessionManager.appendResponse(allText)

            scope.launch {
                delay(800) // wait for dialog to fully appear
                val next = UssdSessionManager.getNextOption()
                if (next != null) {
                    Log.d("USSD", "Sending option: $next")
                    sendUssdReply(root, next)
                } else {
                    // No more options → session finished
                    Log.d("USSD", "USSD session completed")
                    UssdSessionManager.finish()
                    // Notify the service that we are done (you can use a broadcast or shared flow)
                }
            }
        }
    }

    private fun sendUssdReply(root: AccessibilityNodeInfo, text: String) {
        // Try to find EditText
        val editTexts = findNodesByClass(root, "android.widget.EditText")
        if (editTexts.isNotEmpty()) {
            val edit = editTexts[0]
            val args = Bundle()
            args.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE, text)
            edit.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT, args)

            // Try to click OK / Send / Reply button
            val buttons = findNodesByClass(root, "android.widget.Button")
            for (btn in buttons) {
                val btnText = btn.text?.toString()?.lowercase() ?: ""
                if (btnText.contains("ok") || btnText.contains("send") ||
                    btnText.contains("reply") || btnText.contains("yes") ||
                    btnText.contains("continue") || btnText.isEmpty()) {
                    btn.performAction(AccessibilityNodeInfo.ACTION_CLICK)
                    return
                }
            }
            // Fallback: click first button
            if (buttons.isNotEmpty()) {
                buttons[0].performAction(AccessibilityNodeInfo.ACTION_CLICK)
            }
        } else {
            // Some devices show only buttons (no input field) — try clicking matching option
            val clickables = findClickableNodes(root)
            for (node in clickables) {
                val t = node.text?.toString() ?: ""
                if (t.contains(text) || t.startsWith(text)) {
                    node.performAction(AccessibilityNodeInfo.ACTION_CLICK)
                    return
                }
            }
        }
    }

    private fun extractAllText(node: AccessibilityNodeInfo?): String {
        if (node == null) return ""
        val sb = StringBuilder()
        if (node.text != null) sb.append(node.text).append(" ")
        for (i in 0 until node.childCount) {
            sb.append(extractAllText(node.getChild(i)))
        }
        return sb.toString()
    }

    private fun findNodesByClass(root: AccessibilityNodeInfo, className: String): List<AccessibilityNodeInfo> {
        val result = mutableListOf<AccessibilityNodeInfo>()
        fun recurse(node: AccessibilityNodeInfo?) {
            if (node == null) return
            if (node.className?.toString() == className) result.add(node)
            for (i in 0 until node.childCount) recurse(node.getChild(i))
        }
        recurse(root)
        return result
    }

    private fun findClickableNodes(root: AccessibilityNodeInfo): List<AccessibilityNodeInfo> {
        val result = mutableListOf<AccessibilityNodeInfo>()
        fun recurse(node: AccessibilityNodeInfo?) {
            if (node == null) return
            if (node.isClickable) result.add(node)
            for (i in 0 until node.childCount) recurse(node.getChild(i))
        }
        recurse(root)
        return result
    }

    override fun onInterrupt() {}
}