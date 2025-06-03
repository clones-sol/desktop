import type { Quest } from '$lib/types/gym';
import { invoke } from '@tauri-apps/api/core';

/**
 * Start recording a quest
 * @param quest Optional quest to record
 * @param fps Frames per second (default: 30)
 * @returns Promise that resolves when recording starts
 */
export async function startRecording(quest?: Quest, fps: number = 30): Promise<void> {
  try {
    // If quest has reward info, include poolId and generatedTime in meta
    await invoke('start_recording', { quest, fps });
  } catch (error) {
    console.error('Failed to start recording:', error);
    throw error;
  }
}

/**
 * Stop recording
 * @param reason Optional reason for stopping
 * @returns Promise resolving to the recording ID
 */
export async function stopRecording(reason?: string): Promise<string> {
  try {
    const recordingId = await invoke<string>('stop_recording', { reason });
    return recordingId;
  } catch (error) {
    console.error('Failed to stop recording:', error);
    throw error;
  }
}
