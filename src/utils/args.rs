use std::path::PathBuf;

use clap::Parser;

#[derive(Parser, Debug)]
#[clap(about, long_about = None)]
pub struct MainArgs {
    // Required
    #[clap(short, long, value_parser, value_name = "Config file")]
    pub config: PathBuf,
    /// OBS main version
    #[clap(long, value_parser, value_name = "Major.Minor.Patch[-(rc|beta)Num]")]
    pub version: String,

    // Optional version suffix
    #[clap(long, value_parser, value_name = "Beta number")]
    pub beta: Option<u8>,
    #[clap(long, value_parser, value_name = "RC number")]
    pub rc: Option<u8>,
    #[clap(long, value_parser, value_name = "Beta branch")]
    pub branch: Option<String>,

    // Optional overrides
    #[clap(long, value_parser, value_name = "new build")]
    pub new: Option<PathBuf>,
    #[clap(long, value_parser, value_name = "old builds")]
    pub old: Option<PathBuf>,
    #[clap(long, value_parser, value_name = "output dir")]
    pub out: Option<PathBuf>,
    /// File containing release notes
    #[clap(long, value_parser, value_name = "file.rtf")]
    pub note_file: Option<PathBuf>,
    /// Falls back to "UPDATER_PRIVATE_KEY" env var
    #[clap(short, long, value_parser, value_name = "file.pem")]
    pub private_key: Option<PathBuf>,

    // Optional flags
    /// Skip creating NSIS installer
    #[clap(long, value_parser, default_value_t = false)]
    pub skip_installer: bool,
    /// Skip creating delta patches
    #[clap(long, value_parser, default_value_t = false)]
    pub skip_patches: bool,
    /// Skip codesigning
    #[clap(long, value_parser, default_value_t = false)]
    pub skip_codesigning: bool,
    /// Skip signing manifest
    #[clap(long, value_parser, default_value_t = false)]
    pub skip_manifest_signing: bool,
    /// Clear existing output directory
    #[clap(short, long, value_parser, default_value_t = false)]
    pub clear_output: bool,
}