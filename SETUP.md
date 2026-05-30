# Black Rhino Gaming - Complete Twitch Overlay Setup

## 🎯 What's Included

This is a **fully-hosted, professional-grade** Twitch overlay with military/Gray Zone Warfare theme:

- ✅ **All-in-one overlay** (banner, chat, alerts, events, goal bar)
- ✅ **Animated military HUD** with pulsing glow effects
- ✅ **Real-time Twitch integration** via StreamElements
- ✅ **Hosted on GitHub Pages** — always online, no server to run
- ✅ **Lightweight** — runs smooth even on older PCs
- ✅ **Custom everything** — full control over styling

---

## 📁 Files

| File | Purpose |
|------|---------|
| `index.html` | Main overlay (1920x1080) |
| `alerts-only.html` | Standalone alerts (600x300) |
| `chat-only.html` | Standalone chat (320x420) |
| `events-only.html` | Standalone event list (280x200) |

---

## 🚀 Quick Start (5 Minutes)

### Step 1: Create GitHub Repository

1. Go to [github.com](https://github.com) and sign in
2. Click **New Repository**
3. Name it `blackrhino-overlay`
4. Make it **Public**
5. Click **Create Repository**

### Step 2: Upload Files

1. In your new repo, click **Upload files**
2. Drag all files from this folder (`hosted/`)
3. Click **Commit changes**

### Step 3: Enable GitHub Pages

1. In your repo, click **Settings**
2. Scroll down to **Pages**
3. Under **Source**, select **Deploy from a branch**
4. Select **main** branch, **/root** folder
5. Click **Save**
6. Wait 2-3 minutes, then copy the URL (looks like `https://yourname.github.io/blackrhino-overlay/`)

### Step 4: Add to OBS

1. In OBS, click **+** in Sources
2. Choose **Browser Source**
3. **Uncheck** "Local File"
4. Paste your GitHub Pages URL + `/index.html`
   - Example: `https://blackrhino.github.io/blackrhino-overlay/index.html`
5. Set **Width: 1920**, **Height: 1080**
6. Click OK

---

## 🔌 Connect to Twitch (StreamElements)

### Option A: StreamElements Overlay (Easiest)

1. Go to [streamelements.com](https://streamelements.com)
2. Sign in with Twitch
3. Go to **Overlays** → **Create New Overlay**
4. Add widgets: **Alert Box**, **Chat Box**, **Event List**
5. Style them with these colors:
   - Background: `#1a1e12`
   - Text: `#6b8e23`
   - Border: `#4a5d23`
6. Copy the overlay URL
7. Use that URL in OBS instead of GitHub Pages

### Option B: Custom StreamElements Integration (Advanced)

For full custom control with real Twitch events:

1. Get your **JWT token** from StreamElements:
   - streamelements.com → **Account** → **Connected Apps** → **Show Secrets**

2. Edit `index.html`, find this section:
```javascript
function connectStreamElements() {
  console.log('Ready for StreamElements integration');
```

3. Replace with your token:
```javascript
const socket = io('https://realtime.streamelements.com', {
  transports: ['websocket']
});

socket.on('connect', () => {
  socket.emit('authenticate', {
    method: 'jwt',
    token: 'YOUR_JWT_TOKEN_HERE'
  });
});

socket.on('event', (data) => {
  // Handle follows
  if (data.type === 'follow') {
    showAlert('follow', data.data.username);
    addEvent('follow', data.data.username);
  }
  // Handle subs
  if (data.type === 'subscriber') {
    showAlert('sub', data.data.username);
    addEvent('sub', data.data.username);
  }
  // Handle raids
  if (data.type === 'raid') {
    showAlert('raid', data.data.username, data.data.amount + ' viewers');
    addEvent('raid', data.data.username, data.data.amount);
  }
  // Handle bits
  if (data.type === 'cheer') {
    showAlert('bits', data.data.username, data.data.amount + ' bits');
    addEvent('bits', data.data.username, data.data.amount);
  }
  // Handle donations
  if (data.type === 'tip') {
    showAlert('dono', data.data.username, '$' + data.data.amount);
    addEvent('dono', data.data.username, '$' + data.data.amount);
  }
});
```

4. Upload to GitHub Pages
5. Use the URL in OBS

---

## 🎨 Customization

### Change Colors

Edit the CSS variables at the top of `index.html`:

```css
:root {
  --primary-green: #6b8e23;
  --dark-green: #4a5d23;
  --bg-dark: #1a1e12;
  --text: #c8d4a8;
  --accent-red: #ff4444;
}
```

### Change Sub Goal

Find this in the JavaScript:
```javascript
document.getElementById('goal-text').textContent = '0 / 5';
document.getElementById('goal-fill').style.width = '0%';
```

Change to your goal:
```javascript
document.getElementById('goal-text').textContent = '3 / 10';
document.getElementById('goal-fill').style.width = '30%';
```

### Add Custom Sounds

Add to the `showAlert()` function:
```javascript
const audio = new Audio('https://yourdomain.com/alert-sound.mp3');
audio.volume = 0.5;
audio.play();
```

---

## 🔧 Troubleshooting

| Problem | Solution |
|---------|----------|
| Overlay not showing | Check GitHub Pages URL is correct |
| Events not appearing | Connect StreamElements JWT token |
| Chat not working | Use StreamElements Chat widget instead |
| Slow performance | Reduce animation complexity in CSS |
| White background | Make sure `background: transparent` in CSS |

---

## 🎮 Gray Zone Warfare Specific Tips

### Stream Title Ideas
```
GZW | SOLO STASH RUNS - 5M+ THIS SESSION - TIPS FOR NEW PLAYERS
GZW | PVP HUNTING SQUADS - HIGH RISK HIGH REWARD - !DISCORD
GZW | HARDCORE MODE - PERMADEATH RUN - ONE LIFE ONLY
GZW | HELPING NEW PLAYERS - ASK ANYTHING - EXTRACT GUIDES
```

### Tags to Use
- `English`
- `Playing with Viewers`
- `First Playthrough`
- `Backseating Allowed`
- `Gray Zone Warfare`

### Best Stream Times
- **Peak:** 8pm-12am EST
- **Less Competition:** 10am-2pm EST
- **Avoid:** When summit1g/shroud play GZW

---

## 💪 You're Ready

Your overlay is now:
- ✅ Hosted online (no local server)
- ✅ Military themed
- ✅ Animated and eye-catching
- ✅ Integrated with Twitch events
- ✅ Professional quality

Go live and get those first followers, baby! 🎖️
