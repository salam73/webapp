package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    try {
      flutterEngine.getPlugins().add(new com.example.espresso.EspressoPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin espresso, com.example.espresso.EspressoPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new vn.hunghd.flutterdownloader.FlutterDownloaderPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin flutter_downloader, vn.hunghd.flutterdownloader.FlutterDownloaderPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.pichillilorenzo.flutter_inappwebview.InAppWebViewFlutterPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin flutter_inappwebview, com.pichillilorenzo.flutter_inappwebview.InAppWebViewFlutterPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new dev.flutter.plugins.integration_test.IntegrationTestPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin integration_test, dev.flutter.plugins.integration_test.IntegrationTestPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin path_provider_android, io.flutter.plugins.pathprovider.PathProviderPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin permission_handler, com.baseflow.permissionhandler.PermissionHandlerPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.urllauncher.UrlLauncherPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin url_launcher, io.flutter.plugins.urllauncher.UrlLauncherPlugin", e);
    }
  }
}
