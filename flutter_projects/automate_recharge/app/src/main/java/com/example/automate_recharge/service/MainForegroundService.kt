package com.example.automate_recharge.service

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Intent
import android.os.IBinder
import androidx.core.app.NotificationCompat
import com.example.automate_recharge.data.db.AppDatabase
import com.example.automate_recharge.network.WebSocketManager
import com.example.automate_recharge.ui.MainActivity
import com.example.automate_recharge.ussd.UssdExecutor


class MainForegroundService : Service() {

    private lateinit var webSocketManager: WebSocketManager
    private lateinit var ussdExecutor: UssdExecutor

    override fun onCreate() {
        super.onCreate()
        val db = AppDatabase.getInstance(this)
        webSocketManager = WebSocketManager(db)
        ussdExecutor = UssdExecutor(this, db)

        startForeground(1, createNotification())
        webSocketManager.connect()
        ussdExecutor.startProcessing()
    }

    private fun createNotification(): Notification {
        val channelId = "ussd_agent_channel"
        val channel = NotificationChannel(channelId, "USSD Agent", NotificationManager.IMPORTANCE_LOW)
        getSystemService(NotificationManager::class.java).createNotificationChannel(channel)

        val pending = PendingIntent.getActivity(
            this, 0, Intent(this, MainActivity::class.java),
            PendingIntent.FLAG_IMMUTABLE
        )

        return NotificationCompat.Builder(this, channelId)
            .setContentTitle("USSD Agent Running")
            .setContentText("Listening for tasks & SMS")
            .setSmallIcon(android.R.drawable.ic_menu_call)
            .setContentIntent(pending)
            .setOngoing(true)
            .build()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onDestroy() {
        webSocketManager.disconnect()
        super.onDestroy()
    }
}