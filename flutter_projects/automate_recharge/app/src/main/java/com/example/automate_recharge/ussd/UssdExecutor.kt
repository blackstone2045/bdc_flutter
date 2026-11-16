package com.example.automate_recharge.ussd

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.util.Log
import com.example.automate_recharge.data.api.ApiUploader
import com.example.automate_recharge.data.db.AppDatabase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class UssdExecutor(
    private val context: Context,
    private val db: AppDatabase
) {

    private val scope = CoroutineScope(Dispatchers.IO + SupervisorJob())

    fun startProcessing() {
        scope.launch {
            while (isActive) {
                val task = db.ussdTaskDao().getNextPending()
                if (task != null) {
                    processTask(task)
                }
                delay(3000)
            }
        }
    }

    private suspend fun processTask(task: com.example.automate_recharge.data.model.UssdTask) {
        Log.d("USSD", "Starting task ${task.id}")
        db.ussdTaskDao().updateStatus(task.id, "running", null)

        UssdSessionManager.startSession(task.id, task.options)

        // Dial USSD
        withContext(Dispatchers.Main) {
            val encoded = Uri.encode(task.ussdCode)
            val intent = Intent(Intent.ACTION_CALL, Uri.parse("tel:$encoded"))
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            context.startActivity(intent)
        }

        // Wait for session to finish (max 90 seconds)
        var waited = 0
        while (UssdSessionManager.isActive && waited < 90) {
            delay(1000)
            waited++
        }

        val finalResponse = UssdSessionManager.getFinalResponse()
        val success = finalResponse.isNotBlank()

        db.ussdTaskDao().updateStatus(
            task.id,
            if (success) "success" else "failed",
            finalResponse
        )

        // Upload result
        ApiUploader.uploadUssdResult(task.id, finalResponse, success)

        UssdSessionManager.finish()
    }
}