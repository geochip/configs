### BUILT-IN LIBRARIES ###

import os
import subprocess

from typing import List  # noqa: F401

### LIBQTILE ###

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# My version of widget.Volume using `pamixer`
import volume


### AUTOSTART ###

@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run(['sh', script])


### SPECIFIC VARIABLES ##

mod = 'mod4'
TERMINAL = 'alacritty'
BROWSER = 'brave'
FILEMANAGER = 'pcmanfm'


### COLORS ###

colors = {
    'border_focus':          '#34dccc',
    'border_normal':         '#1d2330',
    'border_focus_floating': '#3282b8',
    'bg_odd':                '#0f4c75',
    'bg_even':               '#3282b8',
    'bg_bar':                '#00000000',
    'bg_third':              '#1b262c',
}


### GROUPS ###

# Needed for groups, the rest is at the end of the config
keys = []

groups = [Group(i) for i in '123456789']

for i in groups:
    keys.extend([
        Key(
            [mod], i.name,
            lazy.group[i.name].toscreen(toggle=False),
            desc='Switch to group {}'.format(i.name)
        ),
        Key(
            [mod, 'shift'], i.name,
            lazy.window.togroup(i.name),
            desc='Move focused window to group {}'.format(i.name)
        ),
    ])


### DEFAULT LAYOUT THEME ###

layout_theme = dict(
    border_width=2,
    border_focus=colors['border_focus'],
    border_normal=colors['border_normal'],
    margin=2,
)


### LAYOUTS ###

layouts = [
    layout.Max(),
    layout.Columns(
        **layout_theme,
        border_on_single=True,
    ),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
        Match(wm_class='flameshot'), # Flameshot
        Match(wm_class='display'), # ImageMagick
        Match(role='pop-up'),
        Match(wm_class='zoom'),
        Match(wm_class='conky-semi'),
    ],
    border_width=2,
    border_focus=colors['bg_even'],
    border_normal=colors['border_normal'],
)


### DEFAULT WIDGET SETTINGS ###

widget_defaults = dict(
    font='Roboto Mono Nerd Font',
    fontsize=10,
    padding=8,
)
extension_defaults = widget_defaults.copy()


### SCREENS ###

def icon(icon_text, background):
    return widget.TextBox(
        background=background,
        text=icon_text,
        padding=8,
    )

def arrow(foreground, background, left=True):
    return widget.TextBox(
        text=('\uf0d9' if left else '\uf0da'),
        foreground=foreground,
        background=background,
        fontsize=64,
        padding=-13,
    )

def lower_right_triangle(foreground, background):
    return widget.TextBox(
        text='\u25e2',
        foreground=foreground,
        background=background,
        fontsize=64,
        padding=-1,
    )


screens = [
    Screen(
        top=bar.Bar(
            [

                icon('\uf2db', colors['bg_odd']),
                widget.Memory(
                    foreground='#ffffff',
                    background=colors['bg_odd'],
                    format='{MemUsed:,.0f} MiB / {MemTotal:,.0f} MiB',
                ),

                arrow(
                    foreground=colors['bg_odd'],
                    background=colors['bg_even'],
                    left=False
                ),

                widget.DF(
                    background=colors['bg_even'],
                    format='{p}: {uf:,} {m}iB / {s:,} {m}iB',
                    visible_on_warn=False,
                    update_interval=5,
                    measure='M',
                ),

                arrow(
                    foreground=colors['bg_even'],
                    background=colors['bg_bar'],
                    left=False
                ),

                widget.Spacer(),

                widget.CurrentLayoutIcon(
                    scale=0.6,
                    background=colors['bg_third'],
                ),

                widget.GroupBox(
                    highlight_method='block',
                    disable_drag=True,
                    background=colors['bg_third'],
                ),

                widget.Prompt(),

                widget.Spacer(),

                widget.Systray(),

                widget.Spacer(
                    length=15,
                ),

                arrow(
                    foreground=colors['bg_even'],
                    background=colors['bg_bar']
                ),

                icon('\uf028', colors['bg_even']),
                volume.Volume(
                    background=colors['bg_even']
                ),

                arrow(
                    foreground=colors['bg_odd'],
                    background=colors['bg_even']
                ),

                widget.Battery(
                    background=colors['bg_odd'],
                    charge_char='\ufaf0',
                    discharge_char='\uf578',
                    format='{char} {percent:2.0%}',
                    low_percentage=0.15,
                    notify_below=15,
                ),

                arrow(
                    foreground=colors['bg_even'],
                    background=colors['bg_odd']
                ),

                icon('\uf11c', colors['bg_even']),
                widget.KeyboardLayout(
                    background=colors['bg_even'],
                    configured_keyboards=['us', 'ru', 'jp'],
                    option='caps:ctrl_modifier'
                ),

                arrow(
                    foreground=colors['bg_odd'],
                    background=colors['bg_even']
                ),

                icon('\uf5ef', colors['bg_odd']),
                widget.Clock(
                    background=colors['bg_odd'],
                    format='%I:%M:%S %p, %A %m/%d/%Y',
                ),
            ],
            size=20,
            background=colors['bg_bar'],
            margin=1,
        ),
    ),
]


### QTILE'S VARIABLES ###

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = 'smart'
wmname = 'LG3D'


### USEFUL FUNCTIONS ###

def change_audio_volume(qtile, change: str, delta: str='5'):
    subprocess.run(['pamixer', change, delta])

def toggle_mute_audio(qtile):
    subprocess.run(['pamixer', '-t'])

def change_monitor_brightness(qtile, change: str, delta: str='5'):
    subprocess.run(['xbacklight', change, delta])


### KEY BINDINGS ###

keys.extend([
    # Switch between windows
    Key(
        [mod], 'h',
        lazy.layout.left(),
        desc='Move focus to left'
    ),
    Key(
        [mod], 'l',
        lazy.layout.right(),
        desc='Move focus to right'
    ),
    Key(
        [mod], 'j',
        lazy.layout.down(),
        desc='Move focus down'
    ),
    Key(
        [mod], 'k',
        lazy.layout.up(),
        desc='Move focus up'
    ),
    Key(
        [mod], 'space',
        lazy.layout.next(),
        desc='Move window focus to other window'
    ),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, 'shift'], 'h',
        lazy.layout.shuffle_left(),
        desc='Move window to the left'
    ),
    Key(
        [mod, 'shift'], 'l',
        lazy.layout.shuffle_right(),
        desc='Move window to the right'
    ),
    Key(
        [mod, 'shift'], 'j',
        lazy.layout.shuffle_down(),
        desc='Move window down'
    ),
    Key(
        [mod, 'shift'], 'k',
        lazy.layout.shuffle_up(),
        desc='Move window up'
    ),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod, 'control'], 'h',
        lazy.layout.grow_left(),
        desc='Grow window to the left'
    ),
    Key(
        [mod, 'control'], 'l',
        lazy.layout.grow_right(),
        desc='Grow window to the right'
    ),
    Key(
        [mod, 'control'], 'j',
        lazy.layout.grow_down(),
        desc='Grow window down'
    ),
    Key(
        [mod, 'control'], 'k',
        lazy.layout.grow_up(),
        desc='Grow window up'
    ),
    Key(
        [mod], 'n',
        lazy.layout.normalize(),
        desc='Reset all window sizes'
    ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key(
        # [mod, 'shift'], 'Return',
        # lazy.layout.toggle_split(),
        # desc='Toggle between split and unsplit sides of stack'
    # ),

    # Toggle between different layouts as defined below
    Key(
        [mod], 'Tab',
        lazy.next_layout(),
        desc='Toggle between layouts'
    ),
    Key(
        [mod], 'q',
        lazy.window.kill(),
        desc='Kill focused window'
    ),
    Key(
        [mod], 't',
        lazy.window.toggle_floating(),
        desc='Put the focused window to/from floating mode'
    ),
    Key(
        [mod], 'm',
        lazy.window.toggle_fullscreen(),
        desc='Put the focused window to/from fullscreen mode'
    ),
    Key(
        [mod], 'f',
        lazy.hide_show_bar(),
        desc='Hide or show the qtile bar'
    ),

    # Qtile stuff
    Key(
        [mod, 'control'], 'r',
        lazy.restart(),
        desc='Restart Qtile'
    ),
    Key(
        [mod, 'control'], 'q',
        lazy.shutdown(),
        desc='Shutdown Qtile'
    ),
    Key(
        [mod], 'r',
        lazy.spawncmd(),
        desc='Spawn a command using a prompt widget'
    ),

    # Sound control
    Key(
        [], 'XF86AudioRaiseVolume',
        lazy.function(change_audio_volume, change='-i'),
        desc='Increase volume'
    ),
    Key(
        [], 'XF86AudioLowerVolume',
        lazy.function(change_audio_volume, change='-d'),
        desc='Decrease volume'
    ),
    Key(
        [], 'XF86AudioMute',
        lazy.function(toggle_mute_audio),
        desc='Toggle mute audio'
    ),

    # Monitor brightness control
    Key(
        [], 'XF86MonBrightnessUp',
        lazy.function(change_monitor_brightness, change='-inc'),
        desc='Increase brightness'
    ),
    Key(
        [], 'XF86MonBrightnessDown',
        lazy.function(change_monitor_brightness, change='-dec'),
        desc='Decrease brightness'
    ),

    # Keyboard layout control
    Key(
        ['shift'], 'Alt_L',
        lazy.widget['keyboardlayout'].next_keyboard(),
        desc='Next keyboard layout'
    ),

    # Screenshots
    Key(
        [], 'Print',
        # lazy.spawn('flameshot screen -c -p ' + os.path.expanduser('~/Pictures/screenshots/')),
        lazy.spawn('ksnip -m'),
        desc='Run screenshot utility and take a screenshot of the whole screen'
    ),
    Key(
        ['control'], 'Print',
        # lazy.spawn('flameshot gui'),
        lazy.spawn('ksnip -r'),
        desc='Run screenshot utility and take a screenshot of a region of the screen'
    ),
    Key(
        ['shift'], 'Print',
        lazy.spawn('ksnip -a'),
        desc='Run screenshot utility and take a screenshot of the active window'
    ),

    # Running applications
    Key(
        [mod], 'Return',
        lazy.spawn(TERMINAL),
        desc='Launch terminal'
    ),
    Key(
        [mod, 'shift'], 'Return',
        lazy.spawn('rofi -show run'),
        desc='Run rofi'
    ),
    Key(
        [mod], 'b',
        lazy.spawn(BROWSER),
        desc='Run browser of choice'
    ),
    Key(
        [mod], 'g',
        lazy.spawn(FILEMANAGER),
        desc='Run GUI-based file manager of choice'
    ),
])


def show_keys(keys):
    """
    print current keybindings in a pretty way for a rofi/dmenu window.
    """
    key_help = ''
    keys_ignored = (
        'XF86AudioMute',
        'XF86AudioLowerVolume',
        'XF86AudioRaiseVolume',
        'XF86AudioPlay',
        'XF86AudioNext',
        'XF86AudioPrev',
        'XF86AudioStop',
        'XF86MonBrightnessUp',
        'XF86MonBrightnessDown',
    )
    text_replaced = {
        'mod4':      '[S]',
        'control':   '[Ctrl]',
        'mod1':      '[Alt]',
        'shift':     '[Shift]',
        'less':      '<',
        'ampersand': '&',
        'Escape':    'Esc',
        'Return':    'Enter',
    }
    for k in keys:
        if k.key in keys_ignored:
            continue

        mods = ''
        key = ''
        desc = k.desc
        for m in k.modifiers:
            if m in text_replaced.keys():
                mods += text_replaced[m] + ' + '
            else:
                mods += m.capitalize() + ' + '

        if len(k.key) > 1:
            if k.key in text_replaced.keys():
                key = text_replaced[k.key]
            else:
                key = k.key.title()
        else:
            key = k.key

        key_line = '{:<30} {}'.format(mods + key, desc + '\n')
        key_help += key_line

        # debug_print(key_line)  # debug only

        return key_help

keys.extend([
    Key(
        [mod], 'F1',
        lazy.spawn("sh -c 'echo \"" + show_keys(keys) + "\" | rofi -dmenu -p Find -i -mesg \"Keyboard shortcuts\"'"),
        desc='Print keyboard bindings'
    )
])


### DRAG FLOATING LAYOUTS ###

mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], 'Button3', lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], 'Button2', lazy.window.bring_to_front())
]

