# OBS Setup - Quick Reference

## Scene: "GZW Live" (Main Game Scene)

| Source | URL / File | Width | Height | Position | Layer |
|--------|-----------|-------|--------|----------|-------|
| Game Capture | Your game window | 1920 | 1080 | Full screen | Bottom |
| **Overlay** | `https://YOURNAME.github.io/blackrhino-overlay/index.html` | 1920 | 1080 | Full screen | Top |

**Note:** After setting URL, check:
- ✅ **Shutdown source when not visible** (for performance)
- ✅ **Refresh browser when scene becomes active**

---

## Alternative: Separate Components

If you prefer individual elements instead of all-in-one:

| Source | URL | Width | Height | Position |
|--------|-----|-------|--------|----------|
| Banner Only | `/index.html` (crop to top-left) | 600 | 100 | Top-left |
| Chat Only | `/chat-only.html` | 320 | 420 | Top-right |
| Alerts Only | `/alerts-only.html` | 600 | 300 | Bottom-center |
| Events Only | `/events-only.html` | 280 | 250 | Right side |

---

## Scene: "Starting Soon"

Use your existing `starting-soon.html` or create a hosted version.

---

## Scene: "BRB" / "Intermission"

Use your existing screens or I'll create hosted versions if needed.

---

## Performance Tips

1. **Browser Source FPS:** Set to 30 FPS (not 60) to save resources
2. **Resolution:** If performance is bad, scale to 1280x720 and let OBS upscale
3. **Custom CSS:** If needed, add to Browser Source:
   ```css
   body { transform: scale(0.8); transform-origin: top left; }
   ```

---

## Hotkeys to Set Up

| Action | Hotkey |
|--------|--------|
| Switch to "Starting Soon" | F1 |
| Switch to "GZW Live" | F2 |
| Switch to "BRB" | F3 |
| Start Stream | Ctrl+Shift+S |
| Stop Stream | Ctrl+Shift+E |

Set these in OBS: **Settings** → **Hotkeys**

---

## Twitch Chat Integration

### Option 1: Built-in (All-in-one overlay)
The `index.html` includes chat and shows real messages when connected to StreamElements.

### Option 2: StreamElements Chat Box (Easier)
1. streamelements.com → Overlays → Chat Box
2. Copy URL
3. Add as separate Browser Source
4. Position: Top-right, Size: 320x420

---

## Testing Your Overlay

Before going live:

1. **Start the server** (if using local) or verify GitHub Pages is live
2. **Check OBS preview** — overlay visible?
3. **Test alerts** — type in your own chat, should appear in Tactical Log
4. **Test goal bar** — does it show 0/5?
5. **Check performance** — CPU usage under 80%?

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Overlay white/gray background | Check `background: transparent` in CSS |
| Overlay not updating | Refresh Browser Source or restart OBS |
| Chat not showing | Connect StreamElements JWT token |
| Events not appearing | Make sure StreamElements overlay is linked |
| Overlay laggy | Reduce CSS animations or lower FPS to 30 |
| Corners cut off | Make sure source is exactly 1920x1080 |

---

## Your Overlay URLs (Fill These In)

Once uploaded to GitHub Pages:

```
Main Overlay: https://____________.github.io/blackrhino-overlay/index.html
Chat Only:    https://____________.github.io/blackrhino-overlay/chat-only.html
Alerts Only:  https://____________.github.io/blackrhino-overlay/alerts-only.html
Events Only:  https://____________.github.io/blackrhino-overlay/events-only.html
```

Copy these URLs into OBS Browser Sources.
