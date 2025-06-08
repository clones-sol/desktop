import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get viteEnv => dotenv.env['VITE_ENV'] ?? 'dev';
  static String get viralTokenAddress =>
      dotenv.env['VITE_VIRAL_TOKEN_ADDRESS'] ?? '';
  static String get solTokenAddress =>
      dotenv.env['VITE_SOL_TOKEN_ADDRESS'] ?? '';
  static String get privacyPolicyUrl =>
      dotenv.env['VITE_PRIVACY_POLICY_URL'] ?? '';
  static String get s3BaseUrl => dotenv.env['VITE_S3_BASE_URL'] ?? '';
  static String get solscanBaseUrl => dotenv.env['VITE_SOLSCAN_BASE_URL'] ?? '';
  static String get apiUrl => dotenv.env['VITE_API_URL'] ?? '';
  static String get jupiterApiUrl => dotenv.env['VITE_JUPITER_API_URL'] ?? '';
  static String get dumpTreeUrlWin => dotenv.env['DUMP_TREE_URL_WIN'] ?? '';
  static String get dumpTreeUrlLinux => dotenv.env['DUMP_TREE_URL_LINUX'] ?? '';
  static String get dumpTreeUrlMacos => dotenv.env['DUMP_TREE_URL_MACOS'] ?? '';
  static String get ffmpegUrlWin => dotenv.env['FFMPEG_URL_WIN'] ?? '';
  static String get ffmpegUrlLinux => dotenv.env['FFMPEG_URL_LINUX'] ?? '';
  static String get ffmpegUrlMacos => dotenv.env['FFMPEG_URL_MACOS'] ?? '';
  static String get ffprobeUrlMacos => dotenv.env['FFPROBE_URL_MACOS'] ?? '';
  static String get pipelineUrlWin => dotenv.env['PIPELINE_URL_WIN'] ?? '';
  static String get pipelineUrlLinux => dotenv.env['PIPELINE_URL_LINUX'] ?? '';
  static String get pipelineUrlMacos => dotenv.env['PIPELINE_URL_MACOS'] ?? '';
}
