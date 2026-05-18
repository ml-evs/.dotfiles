# CLAUDE.md — context for future sessions in this repo

Personal dotfiles for Matthew Evans on Manjaro Linux. The repo lives at
`~/.dotfiles` and is mostly a set of files symlinked into `~`, `~/.config`,
`~/.local/share`, and `~/.local/bin`.

## Current setup

- **Compositor**: sway 1.12-rc (from AUR `sway-rc`) on wlroots 0.20. Migrated
  from i3+X11 in May 2026, primarily to get better screenshare performance and
  GPU-direct compositing. The old `.i3/config` is preserved for reference but
  sway is the daily driver.
- **Display**: laptop panel `eDP-1` (1920x1200) + ultrawide `DP-2`
  (Aorus CO49DQ, 5120x1440@144Hz) via a KVM. The KVM emulates EDID, so it
  hides hotplug events from sway when switched — see "KVM" below.
- **Bar**: waybar, polybar-flavoured aesthetic (`#16181a` @ ~85% opacity,
  Iosevka Term Nerd Font, 18px). Polybar-style modules, no chrome.
- **Lock screen**: hyprlock. Drives PAM asynchronously, so fingerprint
  (fprintd), FIDO2 (Google Titan via pam_u2f), and password all race
  concurrently. No locker before this worked properly with the fingerprint
  reader on sway.
- **Idle / suspend**: swayidle. 10 min → lock, 15 min → DPMS off,
  2 h → suspend. Lid handling owned by xfce4-power-manager when running.
- **Outputs**: kanshi with `home` / `docked` / `laptop` profiles. Auto-switches
  on real hotplug; `XF86Display` key manually toggles for the KVM case.
- **Wallpaper**: swaybg via `output * bg`, single image. Image is non-ultrawide
  so it upscales; an ultrawide-native replacement is a known TODO.
- **Password manager**: `rbw` (not the official `bw` — Node-CLI startup tax
  was unworkable in scripts). Agent unlocked once per boot, 30-day session.
  Possible Vaultwarden self-hosting move on the horizon.

## Conventions

- **Mod key**: `$mod = Mod1` (Alt). This is *not* the sway default of Mod4 —
  it's deliberately matching i3 muscle memory from years of use. Mod4 (Super)
  is reserved for app launchers (`Mod4+s` slack, `Mod4+w` firefox, etc).
- **`.gitignore` excludes `.config/`** but specific paths are force-added.
  When adding new tracked configs, `git add -f <path>` is required.
- **`exec_always pkill -x foo ; foo`** pattern for daemons without
  single-instance protection (swayidle, kanshi). Plain `exec_always foo` for
  daemons that protect themselves via dbus (xfpm, nm-applet, blueman, waybar).
- **Helper scripts** for sway live in `.config/sway/*.sh`. Misc scripts in
  `scripts/`. Both are bash + jq + `swaymsg -t get_tree` for state queries.

## Design choices worth knowing

- **`$mod+f` is centered-max, not fullscreen.** The 5120px ultrawide makes
  real fullscreen useless; the binding floats the focused window at 1920×1200
  centered, toggling. Real fullscreen is `Mod4+f`. This is the highest-value
  ultrawide ergonomic choice in the config.
- **Scratchpad popups are sized.** `Mod1+Escape` summons via a wrapper that
  forces 1200×800 centered, rather than restoring the window's previous size.
- **Wider horizontal gaps** are configurable per-workspace; not enabled by
  default because workspaces float between outputs.
- **Workspaces 0/1/2 prefer DP-2, 3 prefers eDP-1.** This is initial
  placement only — workspaces can move freely.
- **Mod1 not Super**: do not "fix" this in any rewrite.

## Things that don't / won't work

- **Slack window-share**: blocked upstream in Electron/Chromium-as-shipped-by-
  Slack. Firefox window-share works. Zoom window-share works. Slack only
  offers screen-share. Workaround: share an output, use centered-max to
  dominate it. Tracking: Slack ships their Electron bump.
- **KVM hotplug**: most KVMs (including the one in use) emulate EDID and
  *don't* propagate disconnect events. Kanshi can't auto-switch when the user
  flips the KVM. Manual flip is bound to `XF86Display`.
- **Per-window virtual outputs**: the X11 `xrandr --setmonitor` trick that
  split the ultrawide into 3 logical monitors has no Wayland equivalent in
  sway/wlroots. The `$mod+f` centered-max recovers most of that workflow's
  value.
- **GTK app dark mode**: theme is `Adapta-Nokto-Maia` (Matcha-dark-purple
  was the original tune but the theme files aren't on this machine).
  Managed via `~/.config/gtk-3.0/settings.ini` *and* `gsettings`; both must
  agree or modern (libadwaita) apps flip to light. Edit via `nwg-look`, not
  `lxappearance` (which doesn't update gsettings).

## External services / secrets

- **Bitwarden**: vault is on bitwarden.com; rbw config has the email.
  Possible move to self-hosted Vaultwarden — when that happens, just
  `rbw config set base_url <new-url>` and re-login.
- **Titan FIDO2 key**: registered for U2F via `~/.config/Yubico/u2f_keys`.
  This file is **not** tracked in dotfiles — it's per-device crypto material.
  Re-register the key on each machine with `pamu2fcfg`.
- **PAM stacks**: `/etc/pam.d/{sudo,system-local-login,hyprlock}` have
  `pam_u2f.so` as `sufficient`. Not tracked in dotfiles (system files).
- **API keys / ansible vault**: pulled from rbw at runtime by scripts like
  `deployments/*/.vault-pass.sh`. No secrets in the repo.
