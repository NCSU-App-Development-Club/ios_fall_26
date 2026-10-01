"""Black-and-white wireframes for the 10/1 iOS meeting issues."""
import cairosvg, os

OUT = "/home/claude/ios_fall_26/docs/wireframes"
os.makedirs(OUT, exist_ok=True)
FONT = "DejaVu Sans, sans-serif"
K = "#111"      # ink
G = "#888"      # secondary ink (still grayscale)
L = "#ddd"      # light fill


def svg(w, h, body, title=None):
    t = ""
    if title:
        t = f'<text x="24" y="40" font-family="{FONT}" font-size="22" font-weight="bold" fill="{K}">{title}</text>'
    return (f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" viewBox="0 0 {w} {h}">'
            f'<rect width="{w}" height="{h}" fill="white"/>{t}{body}</svg>')


def text(x, y, s, size=18, weight="normal", fill=K, anchor="start", italic=False):
    st = ' font-style="italic"' if italic else ""
    s = s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
    return (f'<text x="{x}" y="{y}" font-family="{FONT}" font-size="{size}" font-weight="{weight}" '
            f'fill="{fill}" text-anchor="{anchor}"{st}>{s}</text>')


def rect(x, y, w, h, r=0, fill="none", stroke=K, sw=2, dash=None):
    d = f' stroke-dasharray="{dash}"' if dash else ""
    return f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="{r}" fill="{fill}" stroke="{stroke}" stroke-width="{sw}"{d}/>'


def line(x1, y1, x2, y2, stroke=K, sw=2, dash=None):
    d = f' stroke-dasharray="{dash}"' if dash else ""
    return f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" stroke="{stroke}" stroke-width="{sw}" stroke-linecap="round"{d}/>'


def circle(cx, cy, r, fill="none", stroke=K, sw=2):
    return f'<circle cx="{cx}" cy="{cy}" r="{r}" fill="{fill}" stroke="{stroke}" stroke-width="{sw}"/>'


def note(x, y, tx, ty, s, anchor="start"):
    """Annotation: arrow from (tx,ty) text position to target (x,y)."""
    return (line(tx - 10, ty - 6, x, y, stroke=G, sw=1.5, dash="5 4") + circle(x, y, 3, fill=G, stroke=G, sw=1)
            + text(tx, ty, s, size=14, fill=G, anchor=anchor, italic=True))


def caption(x, y, lines, gap=24):
    return "".join(text(x, y + i * gap, "• " + l, size=15, fill=G, italic=True) for i, l in enumerate(lines))


# ---------- simple icons ----------
def pin(x, y, s=1.0, fill=K):
    return (f'<path d="M {x} {y+14*s} C {x-11*s} {y+2*s}, {x-11*s} {y-12*s}, {x} {y-12*s} '
            f'C {x+11*s} {y-12*s}, {x+11*s} {y+2*s}, {x} {y+14*s} Z" fill="{fill}" stroke="{K}" stroke-width="2"/>'
            + circle(x, y - 3 * s, 3.5 * s, fill="white", stroke="white", sw=1))


def person(x, y, filled=True):
    f = K if filled else "white"
    c = K if filled else G
    return (circle(x, y - 9, 5.5, fill=f, stroke=c) +
            f'<path d="M {x-9} {y+11} Q {x-9} {y-1} {x} {y-1} Q {x+9} {y-1} {x+9} {y+11} Z" fill="{f}" stroke="{c}" stroke-width="2"/>')


def magnifier(x, y, color=G):
    return circle(x, y, 8, stroke=color) + line(x + 6, y + 6, x + 12, y + 12, stroke=color, sw=3)


def xcircle(x, y):
    return circle(x, y, 10, fill=G, stroke=G) + line(x - 4, y - 4, x + 4, y + 4, stroke="white") + line(x + 4, y - 4, x - 4, y + 4, stroke="white")


def bus(x, y, s=1.0, stroke=K):
    return (rect(x - 22 * s, y - 26 * s, 44 * s, 46 * s, r=8 * s, stroke=stroke, sw=3) +
            rect(x - 15 * s, y - 18 * s, 30 * s, 16 * s, r=3 * s, stroke=stroke, sw=2) +
            circle(x - 11 * s, y + 10 * s, 3.5 * s, fill=stroke, stroke=stroke) +
            circle(x + 11 * s, y + 10 * s, 3.5 * s, fill=stroke, stroke=stroke) +
            line(x - 14 * s, y + 20 * s, x - 14 * s, y + 28 * s, stroke=stroke, sw=4) +
            line(x + 14 * s, y + 20 * s, x + 14 * s, y + 28 * s, stroke=stroke, sw=4))


def house(x, y, color=K):
    return (f'<path d="M {x-12} {y} L {x} {y-12} L {x+12} {y} M {x-9} {y-2} L {x-9} {y+11} L {x+9} {y+11} L {x+9} {y-2}" '
            f'fill="none" stroke="{color}" stroke-width="2.5" stroke-linejoin="round"/>')


def mapicon(x, y, color=K):
    return (f'<path d="M {x-13} {y-9} L {x-4} {y-12} L {x+4} {y-9} L {x+13} {y-12} L {x+13} {y+10} L {x+4} {y+13} '
            f'L {x-4} {y+10} L {x-13} {y+13} Z M {x-4} {y-12} L {x-4} {y+10} M {x+4} {y-9} L {x+4} {y+13}" '
            f'fill="none" stroke="{color}" stroke-width="2" stroke-linejoin="round"/>')


def calendar(x, y, color=K):
    return (rect(x - 12, y - 10, 24, 22, r=3, stroke=color) + line(x - 12, y - 3, x + 12, y - 3, stroke=color)
            + line(x - 6, y - 14, x - 6, y - 7, stroke=color) + line(x + 6, y - 14, x + 6, y - 7, stroke=color))


def save(name, s):
    cairosvg.svg2png(bytestring=s.encode(), write_to=f"{OUT}/{name}.png", scale=2)


# ---------- #2 RouteBadge ----------
b = ""
x = 60
for label, w in [("40", 58), ("41", 58), ("3", 44), ("11X", 74)]:
    b += rect(x, 90, w, 40, r=8, fill=K, stroke=K) + text(x + w / 2, 117, label, size=20, weight="bold", fill="white", anchor="middle")
    x += w + 24
b += note(366, 110, 430, 116, "width grows with the text")
b += caption(60, 180, ["background fill = route.color", "text = route.number — white, bold", "corner radius = Radius.small, a little padding on every side"])
save("02-route-badge", svg(760, 260, b, "#2  RouteBadge — one badge per route"))

# ---------- #3 StopLabel ----------
b = ""
rows = [("Dunn Ave @ Jeter Dr", "120 m"), ("Talley Student Union", "1.9 km"), ("Hunt Library", None)]
y = 100
for name, dist in rows:
    b += pin(66, y - 6, 1.0) + text(92, y, name, size=20, weight="bold")
    if dist:
        b += text(92, y + 24, dist + " away", size=16, fill=G)
    y += 76
b += note(330, 94, 420, 92, "stop.name — headline")
b += note(205, 118, 420, 150, "distance — smaller, secondary color")
b += note(240, 248, 420, 262, "distanceMeters is nil → show NO distance line")
b += caption(60, 310, ["icon: SF Symbol mappin.circle.fill (or similar), tinted Color.ncsuRed"])
save("03-stop-label", svg(820, 340, b, "#3  StopLabel — pin + name + optional distance"))

# ---------- #4 CrowdMeter ----------
b = ""
y = 100
for filled, label in [(0, "Empty"), (1, "Some seats"), (3, "Full")]:
    for i in range(3):
        b += person(70 + i * 30, y, filled=i < filled)
    b += text(180, y + 7, label, size=18)
    y += 64
b += note(250, 230, 330, 236, "text = level.rawValue")
b += caption(60, 290, ["filled icon = person.fill, empty icon = person (faded)", "Empty = 0 filled, Some seats = 1, Full = 3 — decide it with a switch"])
save("04-crowd-meter", svg(720, 350, b, "#4  CrowdMeter — one row per CrowdLevel"))

# ---------- #5 StatusView ----------
b = rect(140, 70, 420, 260, r=12, stroke=L, sw=2, dash="6 5")
b += bus(350, 140, 1.1, stroke=G)
b += text(350, 222, "No buses right now", size=22, weight="bold", anchor="middle")
b += text(350, 254, "Nothing is scheduled for this stop.", size=16, fill=G, anchor="middle")
b += text(350, 276, "Check back later.", size=16, fill=G, anchor="middle")
b += note(380, 120, 600, 110, "systemImage — big, secondary")
b += note(460, 216, 600, 200, "title — bold")
b += note(470, 262, 600, 280, "message — secondary, centered,")
b += text(600, 298, "wraps onto multiple lines", size=14, fill=G, italic=True)
b += text(140, 360, "Centered in whatever space it's given (dashed box = the space, not part of the view).", size=14, fill=G, italic=True)
save("05-status-view", svg(900, 390, b, "#5  StatusView — empty / error message"))

# ---------- #6 ETAText ----------
b = text(80, 90, "minutes", size=16, weight="bold", fill=G) + text(260, 90, "shows", size=16, weight="bold", fill=G)
b += line(70, 102, 480, 102, stroke=L)
y = 136
for m, out in [(0, "Now"), (1, "1 min"), (12, "12 min"), (60, "1 hr"), (65, "1 hr 5 min"), (135, "2 hr 15 min")]:
    b += text(80, y, str(m), size=20, fill=G) + text(160, y, "→", size=20, fill=G) + text(260, y, out, size=22, weight="bold")
    y += 40
b += note(360, 128, 520, 130, "0 → \"Now\" (stretch: make it red & bold)")
b += note(335, 248, 520, 250, "exactly 60 → \"1 hr\" (no \"0 min\")")
b += note(440, 288, 520, 300, "hours = minutes / 60, leftover = minutes % 60")
save("06-eta-text", svg(940, 380, b, "#6  ETAText — minutes → friendly text"))

# ---------- #7 SearchBar ----------
b = ""
b += rect(60, 80, 520, 50, r=25, fill="#f2f2f2", stroke=G, sw=1.5)
b += magnifier(92, 102) + text(120, 112, "Search for a stop or place", size=18, fill=G)
b += text(60, 160, "empty", size=13, fill=G, italic=True)
b += rect(60, 190, 520, 50, r=25, fill="#f2f2f2", stroke=G, sw=1.5)
b += magnifier(92, 212) + text(120, 222, "Talley", size=18) + xcircle(548, 215)
b += text(60, 270, "with text", size=13, fill=G, italic=True)
b += note(548, 215, 620, 200, "xmark.circle.fill — ONLY when text isn't empty")
b += text(620, 222, "tapping it sets text back to \"\"", size=14, fill=G, italic=True)
b += caption(60, 320, ["left icon: SF Symbol magnifyingglass", "TextField(placeholder, text: $text)", "light gray fill, fully rounded (Capsule)"])
save("07-search-bar", svg(1000, 400, b, "#7  SearchBar — search field with clear button"))


# ---------- #8 App shell ----------
def phone(x, y, w=260, h=500):
    return rect(x, y, w, h, r=34, stroke=K, sw=3)


b = ""
for i, (title, body, active) in enumerate([("Components", "(the gallery)", 0), ("Map", "Coming soon", 1), ("Schedule", "Coming soon", 2)]):
    px = 40 + i * 300
    b += phone(px, 70)
    b += text(px + 24, 130, title, size=22, weight="bold")
    b += text(px + 130, 300, body, size=16, fill=G, anchor="middle", italic=True)
    b += rect(px + 20, 492, 220, 56, r=28, fill="#f2f2f2", stroke=G, sw=1.5)
    for j, (ic, lbl) in enumerate([(house, "Home"), (mapicon, "Map"), (calendar, "Schedule")]):
        cx = px + 58 + j * 72
        col = K if j == active else G
        b += ic(cx, 510, color=col) + text(cx, 540, lbl, size=11, fill=col, anchor="middle", weight="bold" if j == active else "normal")
b += caption(40, 620, ["TabView with 3 tabs: Home (house), Map (map), Schedule (calendar)", "Home tab shows ComponentGallery() for now", "Map & Schedule: a simple placeholder screen for now"], gap=30)
save("08-app-shell", svg(960, 710, b, "#8  App shell — tab bar with Home / Map / Schedule"))

# ---------- Overview (parent issue) ----------
b = phone(60, 70, 330, 620)
b += text(84, 130, "Components", size=24, weight="bold")
sections = [("#2 RouteBadge", 1), ("#3 StopLabel", 2), ("#4 CrowdMeter", 2), ("#5 StatusView", 1), ("#6 ETAText", 1), ("#7 SearchBar", 1)]
y = 158
for name, n in sections:
    b += text(84, y, name.upper(), size=11, fill=G, weight="bold")
    b += rect(80, y + 8, 290, 26 * n + 6 * (n - 1) + 10, r=10, stroke=G, sw=1.5)
    for k in range(n):
        b += rect(90, y + 13 + k * 32, 270, 22, r=4, stroke=G, sw=1, dash="4 3")
    y += 26 * n + 6 * (n - 1) + 10 + 30
b += rect(95, 616, 260, 56, r=28, fill="#f2f2f2", stroke=G, sw=1.5)
for j, ic in enumerate([house, mapicon, calendar]):
    b += ic(150 + j * 75, 644, color=K if j == 0 else G)
b += text(440, 140, "The app opens to a Component Gallery.", size=18, weight="bold")
b += text(440, 172, "Every dashed box is a component nobody has built yet.", size=16, fill=G)
b += text(440, 196, "Each one is a GitHub issue. When your PR merges,", size=16, fill=G)
b += text(440, 220, "your component replaces its placeholder here.", size=16, fill=G)
items = [("#2", "RouteBadge", "beginner"), ("#3", "StopLabel", "beginner"), ("#4", "CrowdMeter", "beginner"),
         ("#5", "StatusView", "beginner"), ("#6", "ETAText", "intermediate"), ("#7", "SearchBar", "intermediate"),
         ("#8", "App shell (tab bar)", "intermediate")]
y = 280
for num, name, lvl in items:
    b += text(440, y, num, size=18, weight="bold") + text(490, y, name, size=18) + text(760, y, lvl, size=15, fill=G, italic=True)
    y += 36
b += note(355, 644, 440, 560, "#8 adds the tab bar")
save("00-overview", svg(960, 720, b, "10/1 iOS Meeting — what we're building"))
print(sorted(os.listdir(OUT)))
