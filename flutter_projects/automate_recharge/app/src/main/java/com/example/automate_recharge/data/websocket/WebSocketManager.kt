package com.example.automate_recharge.network

import android.util.Log
import com.google.gson.Gson
import com.yourcompany.ussdagent.data.db.AppDatabase
import com.yourcompany.ussdagent.data.model.IncomingTask
import com.yourcompany.ussdagent.data.model.UssdTask
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import okhttp3.*
import okio.ByteString
import java.util.concurrent.TimeUnit

class WebSocketManager(
    private val db: AppDatabase,
    private val url: String = "wss://your-server.com/ws" // ← change this
) {
    private val client = OkHttpClient.Builder()
        .readTimeout(0, TimeUnit.MILLISECONDS)
        .pingInterval(30, TimeUnit.SECONDS)
        .build()

    private var webSocket: WebSocket? = null
    private val gson = Gson()
    private val scope = CoroutineScope(Dispatchers.IO)

    fun connect() {
        val request = Request.Builder().url(url).build()
        webSocket = client.newWebSocket(request, object : WebSocketListener() {
            override fun onOpen(webSocket: WebSocket, response: Response) {
                Log.d("WS", "Connected")
            }

            override fun onMessage(webSocket: WebSocket, text: String) {
                Log.d("WS", "Received: $text")
                handleMessage(text)
            }

            override fun onMessage(webSocket: WebSocket, bytes: ByteString) {
                handleMessage(bytes.utf8())
            }

            override fun onClosing(webSocket: WebSocket, code: Int, reason: String) {
                webSocket.close(1000, null)
            }

            override fun onFailure(webSocket: WebSocket, t: Throwable, response: Response?) {
                Log.e("WS", "Failure", t)
                // Auto reconnect after 5s
                android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
                    connect()
                }, 5000)
            }
        })
    }

    private fun handleMessage(text: String) {
        try {
            val task = gson.fromJson(text, IncomingTask::class.java)
            val options = listOfNotNull(
                task.option_0, task.option_1, task.option_2,
                task.option_3, task.option_4, task.option_5, task.option_6
            )

            val entity = UssdTask(
                id = task.id,
                simSlot = task.sim_slot?.toIntOrNull() ?: 0,
                serviceCode = task.service_code ?: "",
                ussdCode = task.ussdcode,
                options = options,
                status = "pending"
            )

            scope.launch {
                db.ussdTaskDao().insert(entity)
                Log.d("WS", "Task saved: ${task.id}")
            }
        } catch (e: Exception) {
            Log.e("WS", "Parse error", e)
        }
    }

    fun disconnect() {
        webSocket?.close(1000, "Bye")
    }
}