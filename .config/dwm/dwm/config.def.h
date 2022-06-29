/* See LICENSE file for copyright and license details. */

#define TERMINAL "st"
#define TERMCLASS "St"

// Sera firefoxdev el vs** de los navegadores?

/* Apariencia */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 4;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
/* COLORES */
// TODO: Remove this later
static char normbgcolor[]           = "#C9D6DF";
static char normfgcolor[]           = "#000000";
static char selfgcolor[]            = "#000000";
static char selbgcolor[]            = "#C9D6DF";

static char normbordercolor[]       = "#FF1818";
static char selbordercolor[]        = "#5463FF";

static char bar_white[]             = "#393E46";
static char bar_text[]              = "#EEEEEE";
static char bar_black[]             = "#EEEEEE";
static char bar_blue[]              = "#0F4C75";
static char *colors[][3] = {
               /*               fg              bg              border   */
    [SchemeNorm]        = { normfgcolor,    normbgcolor,    normbordercolor },
    [SchemeSel]         = { selfgcolor,     selbgcolor,     selbordercolor  },
    [SchemeStatus]      = { bar_black,      bar_white,      "#000000"  }, // Right
    [SchemeTagsSel]     = { bar_text,       bar_blue,      "#000000"  }, // Left
    [SchemeTagsNorm]    = { bar_black,      bar_white,      "#000000"  }, // Left
    [SchemeInfoSel]     = { bar_black,      bar_white,      "#000000"  }, // Middle
    [SchemeInfoNorm]    = { bar_black,      bar_white,      "#000000"  }, // Middle
};
/* FONTS */
static const char *fonts[] = {
  "SF Pro Display:pixelsize=18",
  "JetBrainsMono Nerd Font Mono:pixelsize=20"
};
static const char dmenufont[] = "JetBrainsMono Nerd Font Mono:pixelsize=18";

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {TERMINAL, "-n", "spterm", "-g", "120x34", NULL };
const char *spcmd2[] = {TERMINAL, "-n", "spcalc", "-f", "monospace:size=16", "-g", "50x20", "-e", "bc", "-lq", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spranger",    spcmd2},
};

/* tagging */
static const char *tags[] = { "", "2", "3", "4", "5", "6", "7", "8", "9" };
static const Rule rules[] = {
    /* class            instance    title       tags mask   isfloating  monitor */
	{ "Gimp",	        NULL,		NULL,		1 << 4,		1,			-1 },
	{ "Firefox",        NULL,		NULL,		1 << 8,		0,		    -1 },
    { "Spotify",        NULL,       NULL,       1 << 6,     False,      2 },
    { "Discord",        NULL,       NULL,       1 << 7,     False,      2 },
    { "Steam",          NULL,       NULL,       1 << 6,     False,      2 },
    { "firefoxdeveloperedition",  NULL,       NULL,       1 << 1,     False,      2 },
    { "Chromium",       NULL,       NULL,       1 << 2,     False,      2 },
	{ NULL,             "spterm",   NULL,       SPTAG(0),   1,          1,  0,  -1 },
	{ NULL,             "spcalc",   NULL,       SPTAG(1),   1,          1,  0,  -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbordercolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { TERMINAL, NULL };
static const char *school[] = { "chromium", NULL };

#include <X11/XF86keysym.h>

static Key keys[] = {
	/* modifier                 key        function        argument */
    /* TAGS */
	TAGKEYS(                    XK_1,                      0)
	TAGKEYS(                    XK_2,                      1)
	TAGKEYS(                    XK_3,                      2)
	TAGKEYS(                    XK_4,                      3)
	TAGKEYS(                    XK_5,                      4)
	TAGKEYS(                    XK_6,                      5)
	TAGKEYS(                    XK_7,                      6)
	TAGKEYS(                    XK_8,                      7)
	TAGKEYS(                    XK_9,                      8)
	{ MODKEY,                   XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,         XK_0,      tag,            {.ui = ~0 } },
    /* FS */
    { MODKEY,                   XK_F1,      spawn,          SHCMD("resodunst") },
    { MODKEY,                   XK_F4,      spawn,          SHCMD("displayselect") },
    { MODKEY,                   XK_F5,      xrdb,           {.v = NULL } },
    { MODKEY,                   XK_F7,      spawn,          SHCMD("dmenuusbmount") },
    { MODKEY,                   XK_F8,      spawn,          SHCMD("dmenuusbunmount") },
    { MODKEY,                   XK_F9,      spawn,          SHCMD("mpv --no-cache --no-osc --no-input-default-bindings --profile=low-latency --input-conf=/dev/null --title=webcam $(ls /dev/video[0,2,4,6,8] | tail -n 1)") },
    { MODKEY,                   XK_F11,     spawn,          SHCMD("changekeyboard us") },
    { MODKEY,                   XK_F12,     spawn,          SHCMD("changekeyboard es") },
    /* TECLAS ESPECIALES */
    { MODKEY,                   XK_grave,       spawn,      SHCMD("dmenuemoji") },
    { MODKEY,                   XK_BackSpace,   spawn,      SHCMD("dmenupower") },
    { MODKEY,                   XK_Return,      spawn,      {.v = termcmd } },
    { MODKEY|ShiftMask,         XK_Return,      togglescratch,  {.ui = 0 } },

    { MODKEY,                   XK_space,       zoom,       {0} },
	  { MODKEY|ShiftMask,         XK_space,       togglefloating, {0} },

    { MODKEY,                   XK_Tab,    view,           {0} },
    { MODKEY,                   XK_comma,  focusmon,       {.i = -1 } },
    { MODKEY,                   XK_period, focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,         XK_comma,  tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,         XK_period, tagmon,         {.i = +1 } },

    /* Screenshats && Video */
    { 0,                        XK_Print,       spawn,      SHCMD("maim -i ""$(xdotool getactivewindow)"" | xclip -selection clipboard -t image/png | dunstify -i ""galeria"" ""Imagen copiada a clipboard"" -t 3000") },
    { ShiftMask,                XK_Print,       spawn,      SHCMD("maimpick") },
    { MODKEY,                   XK_Print,       spawn,      SHCMD("dmenurecord") },
    { MODKEY|ShiftMask,         XK_Print,       spawn,      SHCMD("dmenurecord kill") },
    { MODKEY,                   XK_Delete,      spawn,      SHCMD("dmenurecord kill") },

    /* TECLAS */
    { MODKEY,                   XK_q,       killclient,     {0} },
    { MODKEY|ShiftMask,         XK_q,       quit,           {0} },

    { MODKEY,                   XK_w,       spawn,          SHCMD("$BROWSER") },
    { MODKEY|ControlMask,       XK_w,       spawn,          { .v = school } },
    { MODKEY|ShiftMask,         XK_w,       spawn,          SHCMD(TERMINAL " -e sudo nmtui") },
    { MODKEY,                   XK_e,       spawn,          SHCMD(TERMINAL  " -e nvim") },
    { MODKEY,                   XK_r,       spawn,          SHCMD(TERMINAL  " -e lf") },
    { MODKEY|ShiftMask,         XK_r,       spawn,          SHCMD("pcmanfm") },
    { MODKEY|ShiftMask,         XK_p,       spawn,          SHCMD(TERMINAL  " -e gimp") },

    { MODKEY,                   XK_s,       togglesticky,   {0} },
    { MODKEY|ControlMask,       XK_s,       spawn,          SHCMD("steam") },
    { MODKEY,                   XK_d,       spawn,          SHCMD("dmenu_run") },
    { MODKEY|ShiftMask,         XK_d,       spawn,          SHCMD("passmenu") },
    { MODKEY|ControlMask,       XK_d,       spawn,          SHCMD("discord") },
    { MODKEY,                   XK_f,       togglefullscr,  {0} },

    { MODKEY,                   XK_z,       spawn,          SHCMD("$PDFVIEW") },
    { MODKEY|ShiftMask,         XK_c,       spawn,          SHCMD(TERMINAL " -e calcurse") },
    { MODKEY,                   XK_b,       spawn,          SHCMD(TERMINAL " -e bluetoothctl") },
    { MODKEY|ShiftMask,         XK_b,       togglebar,      {0} },
    { MODKEY,                   XK_n,       spawn,          SHCMD("dunstctl close-all") },
    { MODKEY|ShiftMask,         XK_n,       spawn,          SHCMD("dunstctl history-pop") },
    { MODKEY,                   XK_m,       spawn,          SHCMD(TERMINAL " -e pulsemixer") },
    { MODKEY|ShiftMask,         XK_m,       spawn,          SHCMD(TERMINAL " -e neomutt") },
    { MODKEY|ControlMask,       XK_m,       spawn,          SHCMD("$MUSIC") },

    /* LAYOUTS */
    { MODKEY,                   XK_t,      setlayout,      {.v = &layouts[0]} },
    { MODKEY,                   XK_y,      setlayout,      {.v = &layouts[1]} },
    { MODKEY|ShiftMask,         XK_y,      setlayout,      {.v = &layouts[2]} },

    { MODKEY,                   XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,                   XK_k,      focusstack,     {.i = -1 } },
    { MODKEY,                   XK_i,      incnmaster,     {.i = +1 } },
    { MODKEY|ShiftMask,         XK_i,      incnmaster,     {.i = -1 } },
    { MODKEY,                   XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY,                   XK_l,      setmfact,       {.f = +0.05} },


    /* Teclas multimedia */
    { 0, XF86XK_Music,              spawn,      SHCMD("$MUSIC") },
    { 0, XF86XK_AudioMute,          spawn,      SHCMD("changevolume mute") },
    { 0, XF86XK_AudioRaiseVolume,   spawn,      SHCMD("changevolume up") },
    { 0, XF86XK_AudioLowerVolume,   spawn,      SHCMD("changevolume down") },
    { 0, XF86XK_AudioPlay,          spawn,      SHCMD("playerctl play-pause") },
    { 0, XF86XK_AudioStop,          spawn,      SHCMD("playerctl next") },
    { 0, XF86XK_AudioPrev,          spawn,      SHCMD("playerctl previous") },
    { 0, XF86XK_AudioNext,          spawn,      SHCMD("playerctl stop") },
    { 0, XF86XK_MonBrightnessUp,    spawn,      SHCMD("changebrightness up") },
    { 0, XF86XK_MonBrightnessDown,  spawn,      SHCMD("changebrightness down") },
    { 0, XF86XK_Mail,               spawn,      SHCMD(TERMINAL " -e neomutt") },
    { 0, XF86XK_Calculator,         spawn,      SHCMD(TERMINAL " -e bc -l") },
    { 0, XF86XK_MyComputer,         spawn,      SHCMD("displayselect") },
    { 0, XF86XK_Bluetooth,          spawn,      SHCMD(TERMINAL " bluetoothctl") },
    { 0, XF86XK_Favorites,          spawn,      SHCMD(TERMINAL " -e lf") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

