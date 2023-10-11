package com.mobiletechclub.custom_notification_plugin

import android.app.Notification
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.widget.RemoteViews
import androidx.core.content.res.TypedArrayUtils.getString
import com.mobiletechclub.custom_notification_plugin.R
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/**
 * The implementation of [MethodChannel.MethodCallHandler] for the plugin. Responsible for
 * receiving method calls from method channel.
 */
internal class MethodCallHandlerImpl(
    private val context: Context,
) : MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "showCustomNotification" -> {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
                {
                    val title = call.argument<String>("title")
                    val body = call.argument<String>("body")
                    val orderId = call.argument<String>("order-id")

                    // Build the custom notification
                    val customView = RemoteViews(context.packageName, R.layout.custom_notification)


                    val notificationColor = 0xff333333
                    val notification: Notification = Notification.Builder(context, "my_channel")
                        .setColor(notificationColor.toInt())
                        .setColorized(true)
                        .setCustomContentView(customView)
                        .setCustomBigContentView(customView)
                        .setSmallIcon(R.drawable.red_icon)
                        .setOngoing(true)
                        .build()

                    // Show the notification

                    val notificationManager =  context.getSystemService(NotificationManager::class.java)

                    notificationManager.notify(0, notification)

                    result.success("Notificado")
                } else {
                    result.success("Notificado")
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}
