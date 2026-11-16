package com.example.automate_recharge.ussd

import java.util.concurrent.atomic.AtomicInteger

object UssdSessionManager {
    private var currentTaskId: String? = null
    private var options: List<String> = emptyList()
    private val currentIndex = AtomicInteger(0)
    private var finalResponse: StringBuilder = StringBuilder()
    @Volatile var isActive = false

    fun startSession(taskId: String, opts: List<String>) {
        currentTaskId = taskId
        options = opts
        currentIndex.set(0)
        finalResponse = StringBuilder()
        isActive = true
    }

    fun getNextOption(): String? {
        val idx = currentIndex.getAndIncrement()
        return if (idx < options.size) options[idx] else null
    }

    fun appendResponse(text: String) {
        finalResponse.append(text).append("\n")
    }

    fun getFinalResponse(): String = finalResponse.toString().trim()

    fun getCurrentTaskId(): String? = currentTaskId

    fun finish() {
        isActive = false
        currentTaskId = null
    }
}