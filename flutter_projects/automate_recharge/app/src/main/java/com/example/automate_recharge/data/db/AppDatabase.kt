package com.example.automate_recharge.data.db

import android.content.Context
import androidx.room.*
import com.yourcompany.ussdagent.data.model.SmsMessage
import com.yourcompany.ussdagent.data.model.UssdTask

@Dao
interface UssdTaskDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(task: UssdTask)

    @Query("SELECT * FROM ussd_tasks WHERE status = 'pending' ORDER BY createdAt ASC LIMIT 1")
    suspend fun getNextPending(): UssdTask?

    @Query("UPDATE ussd_tasks SET status = :status, response = :response WHERE id = :id")
    suspend fun updateStatus(id: String, status: String, response: String?)

    @Query("SELECT * FROM ussd_tasks WHERE status = 'running' LIMIT 1")
    suspend fun getRunning(): UssdTask?
}

@Dao
interface SmsDao {
    @Insert
    suspend fun insert(sms: SmsMessage): Long

    @Query("SELECT * FROM sms_messages WHERE uploaded = 0 ORDER BY timestamp ASC")
    suspend fun getPending(): List<SmsMessage>

    @Query("UPDATE sms_messages SET uploaded = 1 WHERE id = :id")
    suspend fun markUploaded(id: Long)

    @Query("DELETE FROM sms_messages WHERE uploaded = 1")
    suspend fun clearUploaded()
}

@Database(entities = [UssdTask::class, SmsMessage::class], version = 1, exportSchema = false)
abstract class AppDatabase : RoomDatabase() {
    abstract fun ussdTaskDao(): UssdTaskDao
    abstract fun smsDao(): SmsDao

    companion object {
        @Volatile private var INSTANCE: AppDatabase? = null

        fun getInstance(context: Context): AppDatabase {
            return INSTANCE ?: synchronized(this) {
                Room.databaseBuilder(context, AppDatabase::class.java, "ussd_agent.db")
                    .fallbackToDestructiveMigration()
                    .build()
                    .also { INSTANCE = it }
            }
        }
    }
}