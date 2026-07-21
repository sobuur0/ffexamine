# FFExamine

A fast, minimal media inspector for directories. Prints file size and basic properties for supported media, including an estimated in-memory footprint for images.

Features
- Inspect a directory of media files
- Image support: PNG, JPEG, GIF
- Video support: MP4, MOV, M4A, MKV
- Reports size on disk; for images, reports an estimated memory footprint
- Simple CLI built with Swift Argument Parser

Usage
Basic
- ffexamine --input /path/to/folder

Examples
- Inspect your Pictures folder:
  - ffexamine --input ~/Pictures
- Inspect a mounted drive:
  - ffexamine --input /Volumes/Media

Output
- Images: size on disk, computed memory footprint, quick inspection summary
- Videos: size on disk (additional metadata TBD)
- Unsupported types: clear notice per file

Installation
- Homebrew (recommended)
  - brew tap your/tap
  - brew install ffexamine
- Mint
  - mint install your/repo
- From source
  - git clone https://github.com/your/repo.git
  - cd FFExamine
  - swift build -c release
  - .build/release/ffexamine --help
  
Configuration
- Flags
  - --input <path>  Specify the folder to inspect
- Environment variables
  - FFEXAMINE_LOG=debug|info|silent (TBD)
- Config file
  - .ffexamine.toml (TBD)

Supported Formats
- Images: png, jpeg, gif
- Video: mp4, mov, m4a, mkv
- Planned: webp, heic, tiff, avi (TBD)

Performance
- Single directory listing
- Lightweight per-file checks
- Future: parallel processing, configurable concurrency

Exit Codes
- 0 success
- 1 usage or input error
- 2 internal error (TBD)

Roadmap
- Parallel file processing
- Rich video metadata (duration, codec, bitrate)
- Optional JSON output
- Recursive mode and ignore rules
- Unit tests and benchmarks

Requirements
- Swift 6 (Swift tools 6.2)
- macOS 13+

Acknowledgements
- Built with Swift Argument Parser
- Uses Figlet for banner output
