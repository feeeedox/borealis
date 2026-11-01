// Einstiegspunkt. Hier werden nur die "großen" Teile der Shell eingehängt.
// Neues Feature (Launcher, Notifications, ...)? Einfach unten eine Zeile ergänzen.
import Quickshell
import qs.bar

ShellRoot {
    // Eine Bar pro Monitor
    Variants {
        model: Quickshell.screens
        Bar {}
    }

    // Später z.B.:
    // Launcher {}
    // Notifications {}
}
