/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static const char *fonts[] = {
    "JetBrainsMono Nerd Font Mono:size=13",
    "JoyPixels:pixelsize=16:antialias=true:autohint=true"
};
static const unsigned int bgalpha = 0xe0;
static const unsigned int fgalpha = OPAQUE;
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

static char bar_color[]             = "#7b6ea4";
static char text_white[]            = "#f9effa";
static char text_gold[]             = "#e0cb70";
static char selection_color[]       = "#5a78b4";
static const char *colors[SchemeLast][2] = {
/*                      fg              bg          */
	[SchemeNorm] = { text_white,    bar_color       },
	[SchemeSel] =  { text_gold,     selection_color },
	[SchemeOut] =  { text_white,    selection_color },
};

static const unsigned int alphas[SchemeLast][2] = {
	/*		fgalpha		bgalphga	*/
	[SchemeNorm] = { fgalpha, bgalpha },
	[SchemeSel] = { fgalpha, bgalpha },
	[SchemeOut] = { fgalpha, bgalpha },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
