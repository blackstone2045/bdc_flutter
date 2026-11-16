package com.yourcompany.ussdagent.network

import android.util.Log
import com.yourcompany.ussdagent.data.model.SmsMessage
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject

object ApiUploader {
    private val client = OkHttpClient()
    private const val BASE_URL = "https://your-api.com" // ← change

    fun uploadUssdResult(taskId: String, response: String, success: Boolean): Boolean {
        return try {
            val json = JSONObject().apply {
                put("id", taskId)
                put("response", response)
                put("success", success)
            }
            val body = json.toString().toRequestBody("application/json".toMediaType())
            val request = Request.Builder()
                .url("$BASE_URL/ussd/result")
                .post(body)
                .build()
            client.newCall(request).execute().isSuccessful
        } catch (e: Exception) {
            Log.e("API", "USSD upload failed", e)
            false
        }
    }

    fun uploadSms(sms: SmsMessage): Boolean {
        return try {
            val json = JSONObject().apply {
                put("address", sms.address)
                put("body", sms.body)
                put("timestamp", sms.timestamp)
            }
            val body = json.toString().toRequestBody("application/json".toMediaType())
            val request = Request.Builder()
                .url("$BASE_URL/sms/upload")
                .post(body)
                .build()
            client.newCall(request).execute().isSuccessful
        } catch (e: Exception) {
            Log.e("API", "SMS upload failed", e)
            false
        }
    }
}