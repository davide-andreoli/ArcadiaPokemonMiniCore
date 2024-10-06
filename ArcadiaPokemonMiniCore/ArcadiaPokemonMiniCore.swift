//
//  ArcadiaPokemonMiniCore.swift
//  ArcadiaPokemonMiniCore
//
//  Created by Davide Andreoli on 03/10/24.
//

import Foundation
import ArcadiaCore

@Observable public class ArcadiaPokemonMini: ArcadiaCoreProtocol {
    
    public typealias ArcadiaCoreType = ArcadiaPokemonMini
    
    public var paused = false
    public var initialized = false
    public var mainGameLoop : Timer? = nil
    public var loadedGame: URL? = nil
    public var audioVideoInfo: retro_system_av_info = retro_system_av_info(geometry: retro_game_geometry(base_width: 96, base_height: 64, max_width: 96, max_height: 64, aspect_ratio: 1.5), timing: retro_system_timing(fps: 72.0, sample_rate: 44100.0))
    public var initialSaveRamSnapshot: [UInt8]? = nil
    public var currentSaveRamSnapshot: [UInt32 : [UInt8]]? = [:]
    public var defaultCoreOptions: [ArcadiaCoreOption] = [
        ArcadiaCoreOption(key: "pokemini_lcdfilter", selectedValue: "dotmatrix"),
        ArcadiaCoreOption(key: "pokemini_lcdmode", selectedValue: "0"),
        ArcadiaCoreOption(key: "pokemini_lcdcontrast", selectedValue: "64"),
        ArcadiaCoreOption(key: "pokemini_lcdbright", selectedValue: "0"),
        ArcadiaCoreOption(key: "pokemini_palette", selectedValue: "Default"),
        ArcadiaCoreOption(key: "pokemini_piezofilter", selectedValue: "1"),
        ArcadiaCoreOption(key: "pokemini_screen_shake_lv", selectedValue: "3"),
        ArcadiaCoreOption(key: "pokemini_lowpass_filter", selectedValue: "disabled"),
        ArcadiaCoreOption(key: "pokemini_lowpass_range", selectedValue: "disabled"),
        ArcadiaCoreOption(key: "pokemini_rumble_lv", selectedValue: "10")
    ]
    
    public init() {
    }
    
}

extension ArcadiaPokemonMini {
    public func retroInit() {
        retro_init()
    }
    
    public func retroGetSystemAVInfo(info: UnsafeMutablePointer<retro_system_av_info>!) {
        retro_get_system_av_info(info)
    }
    
    public func retroDeinit() {
        retro_deinit()
    }
    
    public func retroRun() {
        retro_run()
    }
    
    public func retroLoadGame(gameInfo: retro_game_info) -> Bool {
        var gameInfo = gameInfo
        return retro_load_game(&gameInfo)
    }
    
    public func retroReset() {
        retro_reset()
    }
    
    public func retroUnloadGame() {
        retro_unload_game()
    }
    
    public func retroSerializeSize() -> Int {
        return retro_serialize_size()
    }
    
    public func retroSerialize(data: UnsafeMutableRawPointer!, size: Int) {
        retro_serialize(data, size)
    }
    
    public func retroUnserialize(data: UnsafeRawPointer!, size: Int) {
        retro_unserialize(data, size)
    }
    
    public func retroGetMemoryData(memoryDataId: UInt32) -> UnsafeMutableRawPointer! {
        return retro_get_memory_data(memoryDataId)
    }
    
    public func retroGetMemorySize(memoryDataId: UInt32) -> Int {
        return retro_get_memory_size(memoryDataId)
    }
    
    public func retroSetEnvironment(environmentCallback: @convention(c) (UInt32, UnsafeMutableRawPointer?) -> Bool) {
        retro_set_environment(environmentCallback)
    }
    
    public func retroSetVideoRefresh(videoRefreshCallback: @convention(c) (UnsafeRawPointer?, UInt32, UInt32, Int) -> Void) {
        retro_set_video_refresh(videoRefreshCallback)
    }
    
    public func retroSetAudioSample(audioSampleCallback: @convention(c) (Int16, Int16) -> Void) {
        retro_set_audio_sample(audioSampleCallback)
    }
    public func retroSetAudioSampleBatch(audioSampleBatchCallback: @convention(c) (UnsafePointer<Int16>?, Int) -> Int) {
        retro_set_audio_sample_batch(audioSampleBatchCallback)
    }
    public func retroSetInputPoll(inputPollCallback: @convention(c) () -> Void) {
        retro_set_input_poll(inputPollCallback)
    }
    public func retroSetInputState(inputStateCallback: @convention(c) (UInt32, UInt32, UInt32, UInt32) -> Int16) {
        retro_set_input_state(inputStateCallback)
    }
    
}




