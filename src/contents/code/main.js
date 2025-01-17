/*
    SPDX-FileCopyrightText: 2025 almaceleste <pcaptanovska@gmail.com>
    SPDX-License-Identifier: GPL-3.0-or-later
*/

const vertical = true;
const horizontal = true;

const maximizeAllApp = () => {
  const resource = workspace.activeWindow.resourceName;
  const windows = workspace.windowList();

  for (window of windows) {
    if (window.resourceName === resource)
      window.setMaximize(vertical, horizontal);
  }
};

registerShortcut("Minimize all the app",
  "Maximize all windows of the current application",
  "Meta+Shift+Down",
  maximizeAllApp);
