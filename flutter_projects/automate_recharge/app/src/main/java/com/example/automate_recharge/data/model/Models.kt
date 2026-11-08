package com.example.automate_recharge.data.model

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.TypeConverter
import androidx.room.TypeConverters
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken

@Entity(tableName = "ussd_tasks")
@TypeConverters(Converters::class)
data class UssdTask(
    @PrimaryKey val id: String,
    val simSlot: Int = 0,
    val serviceCode: String = "",
    val ussdCode: String,
    val options: List<String> = emptyList(),
    val status: String = "pending", // pending | running | success | failed
    val response: String? = null,
    val createdAt: Long = System.currentTimeMillis()
)

@Entity(tableName = "sms_messages")
data class SmsMessage(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    val address: String,
    val body: String,
    val timestamp: Long,
    val uploaded: Boolean = false
)

class Converters {
    private val gson = Gson()

    @TypeConverter
    fun fromStringList(value: List<String>): String = gson.toJson(value)

    @TypeConverter
    fun toStringList(value: String): List<String> {
        val type = object : TypeToken<List<String>>() {}.type
        return gson.fromJson(value, type) ?: emptyList()
    }
}

// Incoming WebSocket task format (your JSON)
data class IncomingTask(
    val status: String?,
    val id: String,
    val sim_slot: String?,
    val service_code: String?,
    val ussdcode: String,
    val option_0: String? = null,
    val option_1: String? = null,
    val option_2: String? = null,
    val option_3: String? = null,
    val option_4: String? = null,
    val option_5: String? = null,
    val option_6: String? = null,
    val option_0_text: String? = null
)