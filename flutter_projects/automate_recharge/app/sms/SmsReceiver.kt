package com.yourcompany.ussdagent.sms

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.provider.Telephony
import android.util.Log
import com.yourcompany.ussdagent.data.db.AppDatabase
import com.yourcompany.ussdagent.data.model.SmsMessage
import com.yourcompany.ussdagent.network.ApiUploader
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class SmsReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != Telephony.Sms.Intents.SMS_RECEIVED_ACTION) return

        val messages = Telephony.Sms.Intents.getMessagesFromIntent(intent)
        val db = AppDatabase.getInstance(context)

        CoroutineScope(Dispatchers.IO).launch {
            messages.forEach { sms ->
                val entity = SmsMessage(
                    address = sms.originatingAddress ?: "unknown",
                    body = sms.messageBody ?: "",
                    timestamp = sms.timestampMillis
                )
                val id = db.smsDao().insert(entity)
                Log.d("SMS", "Saved SMS from ${entity.address}")

                // Upload immediately
                val success = ApiUploader.uploadSms(entity)
                if (success) {
                    db.smsDao().markUploaded(id)
                    db.smsDao().clearUploaded()
                }
            }
        }
    }
}