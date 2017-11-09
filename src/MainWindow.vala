/*-
 * Copyright (c) 2017 elementary LLC. (https://elementary.io)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

public class ShortcutOverlay.MainWindow : Gtk.Window {
    public MainWindow (Gtk.Application application) {
        Object (
            application: application,
            height_request: 640,
            resizable: false,
            title: _("Keyboard Shortcuts"),
            width_request: 910
        );
    }

    construct {
        var css_provider = new Gtk.CssProvider ();
        css_provider.load_from_resource ("io/elementary/shortcut-overlay/application.css");
        Gtk.StyleContext.add_provider_for_screen (get_screen (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

        var layout = new Gtk.Grid ();
        layout.column_spacing = 6;
        layout.row_spacing = 6;
        layout.hexpand = true;
        layout.margin = 12;

        var key_label = new Gtk.Label (_("⌘"));
        key_label.halign = Gtk.Align.END;
        key_label.get_style_context ().add_class ("keycap");
        key_label.hexpand = true;

        var action_label = new Gtk.Label (_("Application launcher"));
        action_label.halign = Gtk.Align.START;
        action_label.hexpand = true;

        layout.attach (key_label, 0, 0, 1, 1);
        layout.attach (action_label, 1, 0, 1, 1);

        add (layout);
    }
}
