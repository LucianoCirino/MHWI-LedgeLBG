import json
from PyQt5 import QtCore, QtGui, QtWidgets
import pyautogui
import os
import subprocess
from configparser import ConfigParser
QtWidgets.QApplication.setAttribute(QtCore.Qt.AA_EnableHighDpiScaling, True)

LBG_NAMES = ["-", "Accursed Fire", "Bazelcore", "Fatalis Depths", "Royal Surefire Shot", "Safi's Aquashot", "Safi's Drakshot", "Ten Thousand Volts"]
AMMO_NAMES = ["-", "Normal 1", "Normal 2", "Normal 3", "Pierce 1", "Pierce 2", "Pierce 3",
    "Spread 1", "Spread 2", "Spread 3", "Sticky 1", "Sticky 2", "Sticky 3", "Slicing",
    "Flaming", "Water", "Freeze", "Thunder", "Dragon", "Poison 1", "Poison 2",
    "Paralysis 1", "Paralysis 2", "Sleep 1", "Sleep 2", "Exhaust 1", "Exhaust 2",
    "Recovery 1", "Recovery 2", "Demon", "Armor", "Tranq"]
HOTKEYS_PS4 = ["-"] + [f"Joy{i}" for i in range(1, 15)]
HOTKEYS_PC = [f"F{i}" for i in range(1, 13)]
CRAFT_KEYS = [f"{i}" for i in range(1, 8)]
START_CONDITIONS = ["None", "Empty"]
SHOT_LIMITS = ["-"] + [f"{i}" for i in range(1, 10)]
FINISH_ACTIONS = ["Return", "Next"]

class Ui_LLBG(object):

    icon_filePath = "MHWI_LLBG\\gui\\LBG.ico"
    ps4joy_filePath = "MHWI_LLBG\\gui\\ps4joy.png"
    settings_filePath = "MHWI_LLBG\\config\\settings.json"
    runLLBG_filePath = "MHWI_LLBG\\run_llbg.vbs"
    ammoList_filePath = "MHWI_LLBG\\ammo\\ammo_list.ini"
    
    ammo_mapping = {
        "0": "Normal 1", "1": "Normal 2", "2": "Normal 3",
        "3": "Pierce 1", "4": "Pierce 2", "5": "Pierce 3",
        "6": "Spread 1", "7": "Spread 2", "8": "Spread 3",
        "9": "Cluster 1", "10": "Cluster 2", "11": "Cluster 3",
        "13": "Sticky 1", "14": "Sticky 2", "15": "Sticky 3",
        "16": "Slicing", "17": "Flaming", "18": "Water",
        "19": "Freeze", "20": "Thunder", "21": "Dragon Ammo",
        "22": "Poison 1", "23": "Poison 2", "24": "Paralysis 1",
        "25": "Paralysis 2", "26": "Sleep 1", "27": "Sleep 2",
        "28": "Exhaust 1", "29": "Exhaust 2", "30": "Recovery 1",
        "31": "Recovery 2", "32": "Demon", "33": "Armor", "36": "Tranq"
    }

    def setupUi(self, LLBG):
        self.configure_window(LLBG)
        self.create_group_boxes(LLBG)
        self.create_button_boxes(LLBG)
        self.create_button_boxes_2()
        self.create_button_boxes_3()
        self.create_labels(LLBG)
        self.create_combo_boxes(LLBG)
        self.create_check_boxes(LLBG)
        self.create_table_widgets(LLBG)
        self.finalize_setup(LLBG)
        self.load_settings()

    def configure_window(self, window):
        window.setObjectName("LLBG")
        window.resize(558, 329)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(window.sizePolicy().hasHeightForWidth())
        window.setSizePolicy(sizePolicy)
        window.setMinimumSize(QtCore.QSize(558, 329))
        window.setMaximumSize(QtCore.QSize(558, 329))
        window.setWindowFlags(window.windowFlags() & ~QtCore.Qt.WindowContextHelpButtonHint)
        
        # Create a function within this scope that handles the close event
        def closeEvent(event):
            self.stop_script()  # Assuming stop_script is defined in this scope
            QtWidgets.QWidget.closeEvent(window, event)  # Call the default QWidget closeEvent

        # Bind the new close event to the window
        window.closeEvent = closeEvent

    def fixed_size_policy(self, widget):
        size_policy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        size_policy.setHorizontalStretch(0)
        size_policy.setVerticalStretch(0)
        size_policy.setHeightForWidth(widget.sizePolicy().hasHeightForWidth())
        return size_policy

    def create_group_boxes(self, parent):
        self.groupBox_ammoScripting = self.create_group_box(parent, QtCore.QRect(10, 128, 361, 196), "Calibri", 11, "groupBox_ammoScripting", True)
        self.groupBox_ammoScripting.setChecked(False)
        self.groupBox_general = self.create_group_box(parent, QtCore.QRect(10, 3, 201, 121), "Calibri", 11, "groupBox_general")
        self.groupBox_kbmControls = self.create_group_box(parent, QtCore.QRect(384, 3, 161, 281), "Calibri", 11, "groupBox_kbmControls")
        self.groupBox_scriptControls = self.create_group_box(parent, QtCore.QRect(220, 3, 151, 121), "Calibri", 11, "groupBox_scriptControls")

    def create_group_box(self, parent, geometry, font_name, font_size, object_name, checkable=False):
        group_box = QtWidgets.QGroupBox(parent)
        group_box.setGeometry(geometry)
        font = QtGui.QFont(font_name, font_size)
        group_box.setFont(font)
        group_box.setCheckable(checkable)
        group_box.setObjectName(object_name)
        group_box.setAlignment(QtCore.Qt.AlignBottom | QtCore.Qt.AlignLeft)
        return group_box
    
    def create_button_boxes(self, parent):
        self.buttonBoxes = QtWidgets.QDialogButtonBox(parent)
        self.buttonBoxes.setGeometry(QtCore.QRect(378, 285, 171, 41))
        self.buttonBoxes.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBoxes.setCenterButtons(False)
        self.buttonBoxes.setObjectName("buttonBoxes")

        # Create custom buttons
        self.restoreDefaultsButton = QtWidgets.QPushButton("♻️\nReset")
        self.saveButton = QtWidgets.QPushButton("💾\nSave")
        self.runButton = QtWidgets.QPushButton("▶️\nRun")
        self.stopButton = QtWidgets.QPushButton("🛑\nStop")

        # Add custom buttons to the button box
        self.buttonBoxes.addButton(self.restoreDefaultsButton, QtWidgets.QDialogButtonBox.ActionRole)
        self.buttonBoxes.addButton(self.saveButton, QtWidgets.QDialogButtonBox.ActionRole)
        self.buttonBoxes.addButton(self.runButton, QtWidgets.QDialogButtonBox.ActionRole)
        self.buttonBoxes.addButton(self.stopButton, QtWidgets.QDialogButtonBox.ActionRole)

        # Connect the buttons to their respective methods
        self.restoreDefaultsButton.clicked.connect(self.restore_defaults)
        self.saveButton.clicked.connect(self.save_settings)
        self.runButton.clicked.connect(self.run_script)
        self.stopButton.clicked.connect(self.stop_script)

    def create_button_boxes_2(self):
        self.ps4JoyMapButton = QtWidgets.QPushButton("🎮 PS4 Joy Map", self.groupBox_scriptControls)
        self.ps4JoyMapButton.setGeometry(QtCore.QRect(32, 95, 88, 20))
        
        # Set the font for the button
        font = QtGui.QFont("Calibri", 9, QtGui.QFont.Normal)
        self.ps4JoyMapButton.setFont(font)

        # Set padding to push text to the bottom
        self.ps4JoyMapButton.setStyleSheet("QPushButton { padding-bottom: 2px; }")

        self.ps4JoyMapButton.clicked.connect(self.open_ps4_joy_map)
        
    def create_button_boxes_3(self):
        self.newButton = QtWidgets.QPushButton("💼", self.groupBox_ammoScripting)
        self.newButton.setGeometry(QtCore.QRect(328, 39, 22, 22))
        
        # Set the font for the button
        font = QtGui.QFont("Calibri", 9, QtGui.QFont.Normal)
        self.newButton.setFont(font)

        # Set padding to push text to the bottom
        self.newButton.setStyleSheet("QPushButton { padding-bottom: 2px; }")

        # Set a tooltip for the button
        self.newButton.setToolTip("View synchronized ammo list")
    
        # Connect the button to its respective method
        self.newButton.clicked.connect(self.list_ammo_contents)

    def create_dialog_button_box(self, parent, geometry, object_name, standard_buttons):
        button_box = QtWidgets.QDialogButtonBox(parent)
        button_box.setGeometry(geometry)
        button_box.setOrientation(QtCore.Qt.Horizontal)
        button_box.setStandardButtons(standard_buttons)
        button_box.setObjectName(object_name)
        return button_box

    def create_labels(self, parent):
        self.label_primaryHotkey = self.create_label(self.groupBox_ammoScripting, QtCore.QRect(10, 25, 121, 20), "Calibri", 9, "label_primaryHotkey")
        self.label_AmmoSyncHotkey = self.create_label(self.groupBox_ammoScripting, QtCore.QRect(195, 14, 101, 20), "Calibri", 9, "label_AmmoSyncHotkey")
        self.label_primaryHotkeyNote = self.create_label(self.groupBox_ammoScripting, QtCore.QRect(17, 38, 101, 20), "Calibri", 7, "label_primaryHotkeyNote")
        self.label_lbgName = self.create_label(self.groupBox_general, QtCore.QRect(10, 22, 71, 20), "Calibri", 10, "label_lbgName")
        self.label_primaryAmmo = self.create_label(self.groupBox_general, QtCore.QRect(10, 51, 101, 20), "Calibri", 10, "label_primaryAmmo")
        #self.label_kbmControlsNote = self.create_label(self.groupBox_kbmControls, QtCore.QRect(4, 13, 161, 20), "Calibri", 7, "label_kbmControlsNote")
        #self.label_applyChangesNote = self.create_label(parent, QtCore.QRect(379, 310, 181, 20), "Calibri", 7, "label_applyChangesNote")

    def create_label(self, parent, geometry, font_name, font_size, object_name):
        label = QtWidgets.QLabel(parent)
        label.setGeometry(geometry)
        font = QtGui.QFont(font_name, font_size)
        font.setBold(False)
        label.setFont(font)
        label.setObjectName(object_name)
        return label

    def create_combo_boxes(self, parent):
        self.comboBox_primaryHotkey = self.create_combo_box(self.groupBox_ammoScripting, QtCore.QRect(130, 25, 55, 22), "comboBox_primaryHotkey")
        self.comboBox_AmmoSyncHotkey = self.create_combo_box(self.groupBox_ammoScripting, QtCore.QRect(295, 14, 55, 22), "comboBox_AmmoSyncHotkey")
        self.comboBox_lbgName = self.create_combo_box(self.groupBox_general, QtCore.QRect(70, 22, 121, 22), "comboBox_lbgName")
        self.comboBox_primaryAmmo = self.create_combo_box(self.groupBox_general, QtCore.QRect(95, 51, 96, 22), "comboBox_primaryAmmo")
        
        self.comboBox_primaryHotkey.addItems(HOTKEYS_PS4)
        self.comboBox_AmmoSyncHotkey.addItems(HOTKEYS_PS4 + HOTKEYS_PC)
        self.comboBox_lbgName.addItems(LBG_NAMES)
        self.comboBox_primaryAmmo.addItems(AMMO_NAMES)

    def create_combo_box(self, parent, geometry, object_name):
        combo_box = QtWidgets.QComboBox(parent)
        combo_box.setGeometry(geometry)
        combo_box.setObjectName(object_name)
        font = QtGui.QFont("Calibri", 9, QtGui.QFont.Normal)
        combo_box.setFont(font)
        return combo_box

    def create_check_boxes(self, parent):
        self.checkBox_AmmoSync = self.create_check_box(
            parent=self.groupBox_ammoScripting,
            geometry=QtCore.QRect(195, 38, 132, 21),
            font_name="Calibri",
            font_size=9,
            object_name="checkBox_AmmoSync"
        )
        self.checkBox_deepBounces = self.create_check_box(
            parent=self.groupBox_general,
            geometry=QtCore.QRect(52, 75, 131, 21),
            font_name="Calibri",
            font_size=10,
            object_name="checkBox_deepBounces"
        )
        self.checkBox_fpsDipReload = self.create_check_box(
            parent=self.groupBox_general,
            geometry=QtCore.QRect(52, 97, 131, 21),
            font_name="Calibri",
            font_size=10,
            object_name="checkBox_fpsDipReload"
        )

    def create_check_box(self, parent, geometry, font_name, font_size, object_name):
        check_box = QtWidgets.QCheckBox(parent)
        check_box.setGeometry(geometry)
        font = QtGui.QFont()
        font.setFamily(font_name)
        font.setPointSize(font_size)
        check_box.setFont(font)
        check_box.setObjectName(object_name)
        return check_box
            
    def create_table_widgets(self, parent):
        self.tableWidget_ammoScripting = self.create_table_widget(
            parent=self.groupBox_ammoScripting,
            geometry=QtCore.QRect(10, 64, 340, 122),
            font_name="Bahnschrift Condensed",
            font_size=9,
            object_name="tableWidget_ammoScripting",
            column_count=5,
            row_count=5
        )
        self.initialize_table_widget_items(self.tableWidget_ammoScripting)

        self.tableWidget_kbmControls = self.create_table_widget(
            parent=self.groupBox_kbmControls,
            geometry=QtCore.QRect(20, 21, 118, 254),
            font_name="Calibri",
            font_size=8,
            object_name="tableWidget_kbmControls",
            column_count=1,
            row_count=12
        )
        self.initialize_table_widget_items(self.tableWidget_kbmControls)

        self.tableWidget_scriptControls = self.create_table_widget(
            parent=self.groupBox_scriptControls,
            geometry=QtCore.QRect(10, 23, 132, 68),
            font_name="Calibri",
            font_size=9,
            object_name="tableWidget_scriptControls",
            column_count=1,
            row_count=3
        )
        self.initialize_table_widget_items(self.tableWidget_scriptControls)

    def create_table_widget(self, parent, geometry, font_name, font_size, object_name, column_count, row_count):
        table_widget = QtWidgets.QTableWidget(parent)
        table_widget.setGeometry(geometry)
        font = QtGui.QFont(font_name, font_size)
        table_widget.setFont(font)
        table_widget.setObjectName(object_name)
        table_widget.setColumnCount(column_count)
        table_widget.setRowCount(row_count)

        # Set properties based on the object name
        if object_name == "tableWidget_scriptControls" or object_name == "tableWidget_kbmControls":
            table_widget.horizontalHeader().setVisible(False)

        if object_name == "tableWidget_scriptControls":
            table_widget.horizontalHeader().setDefaultSectionSize(50)
            table_widget.verticalHeader().setDefaultSectionSize(20)
        elif object_name == "tableWidget_ammoScripting":
            table_widget.horizontalHeader().setDefaultSectionSize(66)
            table_widget.verticalHeader().setDefaultSectionSize(20)
        elif object_name == "tableWidget_kbmControls":
            table_widget.horizontalHeader().setDefaultSectionSize(60)
            table_widget.verticalHeader().setDefaultSectionSize(16)

        # Disable scrollbars
        table_widget.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        table_widget.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)

        # Initialize table items with centered alignment and italic font
        italic_font = QtGui.QFont(font_name, font_size)
        italic_font.setItalic(True)
        for row in range(row_count):
            for col in range(column_count):
                item = QtWidgets.QTableWidgetItem()
                item.setFont(italic_font)
                item.setTextAlignment(QtCore.Qt.AlignCenter)
                table_widget.setItem(row, col, item)

        # Ensure header items exist
        for row in range(row_count):
            if not table_widget.verticalHeaderItem(row):
                header_item = QtWidgets.QTableWidgetItem()
                table_widget.setVerticalHeaderItem(row, header_item)

        for col in range(column_count):
            if not table_widget.horizontalHeaderItem(col):
                header_item = QtWidgets.QTableWidgetItem()
                table_widget.setHorizontalHeaderItem(col, header_item)

        return table_widget

    def initialize_table_widget_items(self, table_widget):
        if table_widget.objectName() == "tableWidget_ammoScripting":
            column_options = {
                0: AMMO_NAMES,
                1: HOTKEYS_PS4,
                2: START_CONDITIONS,
                3: SHOT_LIMITS,
                4: FINISH_ACTIONS
            }

            # Manually set column widths based on what you determine looks best
            column_widths = [83, 62, 68, 49, 62]

            for row in range(table_widget.rowCount()):
                for column in range(table_widget.columnCount()):
                    combo_box = QtWidgets.QComboBox()
                    combo_box.setStyleSheet("QComboBox { background-color: white; }")

                    # Retrieve the options for the current column
                    options = column_options.get(column, [])
                    # Add the options to the combo box
                    for option in options:
                        combo_box.addItem(option)

                    table_widget.setCellWidget(row, column, combo_box)
                    table_widget.setColumnWidth(column, column_widths[column])
                    
        elif table_widget.objectName() == "tableWidget_scriptControls":
            row_options = {
                0: HOTKEYS_PC,
                1: HOTKEYS_PC,
                2: ["Joy7"]
            }

            for row in range(table_widget.rowCount()):
                combo_box = QtWidgets.QComboBox()
                combo_box.setStyleSheet("QComboBox { background-color: white; }")

                # Retrieve the options for the current row
                options = row_options.get(row, [])
                # Add the options to the combo box
                for option in options:
                    combo_box.addItem(option)

                # Set the combo box as the cell widget for the current row, column 0
                table_widget.setCellWidget(row, 0, combo_box)
            
        else:
            # For other tables, use the standard initialization
            for row in range(table_widget.rowCount()):
                for column in range(table_widget.columnCount()):
                    # Check if the item already exists, if not, create it.
                    if not table_widget.item(row, column):
                        table_widget.setItem(row, column, QtWidgets.QTableWidgetItem())
                    # Similarly, for header items, ensure they exist.
                    if not table_widget.verticalHeaderItem(row):
                        table_widget.setVerticalHeaderItem(row, QtWidgets.QTableWidgetItem())
                    if not table_widget.horizontalHeaderItem(column):
                        table_widget.setHorizontalHeaderItem(column, QtWidgets.QTableWidgetItem())
            
    def finalize_setup(self, LLBG):
        self.retranslateUi(LLBG)
        self.buttonBoxes.accepted.connect(LLBG.accept)
        self.buttonBoxes.rejected.connect(LLBG.reject)
        QtCore.QMetaObject.connectSlotsByName(LLBG)


    def retranslateUi(self, LLBG):
        _translate = QtCore.QCoreApplication.translate
        LLBG.setWindowTitle(_translate("LLBG", "Ledge Light Bowgun (LLBG) Exploit Tool"))
        icon = QtGui.QIcon(self.icon_filePath)
        LLBG.setWindowIcon(icon)
        self.setTitles(_translate)
        self.setAmmoScriptingTableHeaders(_translate)
        self.setKbmControlsTableHeaders(_translate)
        self.setKbmControlsTableItems(_translate)
        self.setScriptControlsTableHeaders(_translate)
        self.setScriptControlsTableItems(_translate)
        self.setNotes(_translate)

    def setTitles(self, _translate):
        self.groupBox_ammoScripting.setTitle(_translate("LLBG", "📜 Ammo Scripting"))
        self.groupBox_general.setTitle(_translate("LLBG", "⚙️ General"))
        self.groupBox_kbmControls.setTitle(_translate("LLBG", "⌨️ KbM Controls"))
        self.groupBox_scriptControls.setTitle(_translate("LLBG", "🕹️ Script Controls"))
        self.label_primaryHotkey.setText(_translate("LLBG", "Primary Ammo Hotkey:"))
        self.label_AmmoSyncHotkey.setText(_translate("LLBG", "Ammo Sync Hotkey:"))
        self.checkBox_AmmoSync.setText(_translate("LLBG", "Automatic Ammo Syncs"))
        self.checkBox_deepBounces.setText(_translate("LLBG", "Deeper Bounces"))
        self.checkBox_fpsDipReload.setText(_translate("LLBG", "FPS Dip Reloads"))
        
        self.label_lbgName.setText(_translate("LLBG", "LBG Name:"))
        self.label_primaryAmmo.setText(_translate("LLBG", "Primary Ammo:"))

    def setAmmoScriptingTableHeaders(self, _translate):
        headers = ["Ammo Name", "Queue Hotkey", "Start Condition", "Shot Limit", "Finish Action"]
        for i, header in enumerate(headers):
            item = self.tableWidget_ammoScripting.horizontalHeaderItem(i)
            item.setText(_translate("LLBG", header))
        for i in range(5):
            item = self.tableWidget_ammoScripting.verticalHeaderItem(i)
            item.setText(_translate("LLBG", str(i + 1)))

    def setKbmControlsTableHeaders(self, _translate):
        self.tableWidget_kbmControls.horizontalHeaderItem(0).setText(_translate("LLBG", "Key"))
        labels = [
            "Walk ⬆️", "Walk ⬇️", "Reload", "Roll", "Ammo 🔼", "Ammo 🔽",
            "Item ←", "Item →", "Fire", "Aim", "Sp. Atk", "Craft"
        ]
        for i, label in enumerate(labels):
            item = self.tableWidget_kbmControls.verticalHeaderItem(i)
            item.setText(_translate("LLBG", label))

    def setKbmControlsTableItems(self, _translate):
        keys = ["w", "s", "Xbutton1", "space", "up", "down", "left", "right", "Lbutton", "Rbutton", "Xbutton2"]
        for i, key in enumerate(keys):
            item = self.tableWidget_kbmControls.item(i, 0)
            item.setText(_translate("LLBG", key))

    def setScriptControlsTableHeaders(self, _translate):
        self.tableWidget_scriptControls.horizontalHeaderItem(0).setText(_translate("LLBG", "Hotkey"))
        labels = ["Reload Script", "Stop Script", "Exit LLBG"]
        for i, label in enumerate(labels):
            item = self.tableWidget_scriptControls.verticalHeaderItem(i)
            item.setText(_translate("LLBG", label))

    def setScriptControlsTableItems(self, _translate):
        hotkeys = ["F6", "F10", "Joy7"]
        for i, hotkey in enumerate(hotkeys):
            if hotkey:
                comboBox = self.tableWidget_scriptControls.cellWidget(i, 0)
                if isinstance(comboBox, QtWidgets.QComboBox):
                    # Find the index of the hotkey in the combo box and set it as the current index
                    index = comboBox.findText(_translate("LLBG", hotkey))
                    if index >= 0:
                        comboBox.setCurrentIndex(index)
                        
    def save_settings(self, no_confirmation=False):
        settings = {
            'LBG Name': self.comboBox_lbgName.currentText(),
            'Primary Ammo': self.comboBox_primaryAmmo.currentText(),
            'Deeper Bounces' : self.checkBox_deepBounces.isChecked(), 
            'FPS Dip Reloads' : self.checkBox_fpsDipReload.isChecked(),
            'keyScriptReload': self.tableWidget_scriptControls.cellWidget(0, 0).currentText(),
            'keyScriptExit': self.tableWidget_scriptControls.cellWidget(1, 0).currentText(),
                       
            'Ammo Script Enabled' : self.groupBox_ammoScripting.isChecked(),
            'Primary Hotkey' : self.comboBox_primaryHotkey.currentText(),
            'Ammo Sync Hotkey' : self.comboBox_AmmoSyncHotkey.currentText(),
            'Auto Ammo Sync' : self.checkBox_AmmoSync.isChecked()

        }
        # Add KbM Controls table settings
        kbm_control_keys = [
            'keyForward',
            'keyBack',
            'keyReload',
            'keyRoll',
            'keyAmmoUp',
            'keyAmmoDown',
            'keyItemLeft',
            'keyItemRight',
            'keyFire',
            'keyADS',
            'keyMine',
            'keyCraft',
        ]
        for i, key in enumerate(kbm_control_keys):
            item = self.tableWidget_kbmControls.item(i, 0)
            settings[key] = item.text() if item else ""
    
        # Add Ammo Script table settings
        for i in range(5):
            for j in range(5):
                comboBox = self.tableWidget_ammoScripting.cellWidget(i, j)
                header = self.tableWidget_ammoScripting.horizontalHeaderItem(j)
                key = f'{i+1} {header.text()}' if header else f'{i+1} Column{j}'
                settings[key] = comboBox.currentText() if comboBox else ""
        
        with open(self.settings_filePath, 'w') as file:
            json.dump(settings, file, indent=4)

        # Display a message box confirming the save
        if not no_confirmation:
            # Display a message box confirming the save if show_confirmation is True
            QtWidgets.QMessageBox.information(None, "Settings Saved", "Your settings have been successfully saved.")

            # Press ahk hotkey to reload script (if running)
            pyautogui.press(settings['keyScriptReload'])

    def load_settings(self):
        try:
            with open(self.settings_filePath, 'r') as file:
                settings = json.load(file)

            # Load combo box and check box settings
            self.comboBox_lbgName.setCurrentText(settings.get('LBG Name', ""))
            self.comboBox_primaryAmmo.setCurrentText(settings.get('Primary Ammo', ""))
            self.checkBox_deepBounces.setChecked(settings.get('Deeper Bounces', False)) 
            self.checkBox_fpsDipReload.setChecked(settings.get('FPS Dip Reloads', False))
            
            # Load settings for QTableWidget with QComboBoxes
            self.tableWidget_scriptControls.cellWidget(0, 0).setCurrentText(settings.get('keyScriptReload', ""))
            self.tableWidget_scriptControls.cellWidget(1, 0).setCurrentText(settings.get('keyScriptExit', ""))
            
            # Load group box check state
            self.groupBox_ammoScripting.setChecked(settings.get('Ammo Script Enabled', False))
            
            # Load other combo box settings
            self.comboBox_primaryHotkey.setCurrentText(settings.get('Primary Hotkey', ""))
            self.comboBox_AmmoSyncHotkey.setCurrentText(settings.get('Ammo Sync Hotkey', ""))
            self.checkBox_AmmoSync.setChecked(settings.get('Auto Ammo Sync', False))

            # Load KbM Controls table settings
            kbm_control_keys = [
                'keyForward',
                'keyBack',
                'keyReload',
                'keyRoll',
                'keyAmmoUp',
                'keyAmmoDown',
                'keyItemLeft',
                'keyItemRight',
                'keyFire',
                'keyADS',
                'keyMine',
                'keyCraft',
            ]
            for i, key in enumerate(kbm_control_keys):
                if self.tableWidget_kbmControls.item(i, 0) is not None:
                    self.tableWidget_kbmControls.item(i, 0).setText(settings.get(key, ""))
            
            # Load Ammo Script table settings
            for i in range(5):
                for j in range(5):
                    comboBox = self.tableWidget_ammoScripting.cellWidget(i, j)
                    if comboBox:
                        header = self.tableWidget_ammoScripting.horizontalHeaderItem(j)
                        key = f'{i+1} {header.text()}' if header else f'{i+1} Column{j}'
                        comboBox.setCurrentText(settings.get(key, ""))

        except (FileNotFoundError, json.JSONDecodeError) as e:
            if isinstance(e, json.JSONDecodeError):
                # If there is a JSON decode error, warn the user
                QtWidgets.QMessageBox.warning(None, "Load Error", "Could not decode the settings file.")
            # Restore defaults and save them without confirmation or reloading AHK
            self.restore_defaults(no_confirmation=True)
            self.save_settings(no_confirmation=True)

    def restore_defaults(self, no_confirmation=False):
        # Check if we should ask for confirmation
        if not no_confirmation:
            reply = QtWidgets.QMessageBox.question(
                None, 
                'Restore Defaults', 
                'Are you sure you want to restore to the default settings?', 
                QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No, 
                QtWidgets.QMessageBox.No
            )
            if reply != QtWidgets.QMessageBox.Yes:
                return  # Do not restore defaults if user chooses not to

        # Reset combo box and check box settings to default values
        self.comboBox_lbgName.setCurrentIndex(0)
        self.comboBox_primaryAmmo.setCurrentIndex(0)
        self.checkBox_deepBounces.setChecked(False)
        self.checkBox_fpsDipReload.setChecked(False)

        # Reset Script Controls table settings to default hotkeys
        default_hotkeys = ["F6", "F10"]
        for i, hotkey in enumerate(default_hotkeys):
            comboBox = self.tableWidget_scriptControls.cellWidget(i, 0)
            if isinstance(comboBox, QtWidgets.QComboBox):
                index = comboBox.findText(hotkey)  # Removed the _translate for simplicity
                if index >= 0:
                    comboBox.setCurrentIndex(index)
                else:
                    comboBox.setCurrentIndex(0)  # Set to the first item if the default is not found

        # Reset group box check state to default
        self.groupBox_ammoScripting.setChecked(False)

        # Reset other combo box settings to default values
        self.comboBox_primaryHotkey.setCurrentIndex(12)
        self.comboBox_AmmoSyncHotkey.setCurrentIndex(13)
        self.checkBox_AmmoSync.setChecked(False)

        # Reset KbM Controls table settings to default key bindings
        default_keys = ["w", "s", "Xbutton1", "space", "up", "down", "left", "right", "Lbutton", "Rbutton", "Xbutton2"]
        for i, key in enumerate(default_keys):
            item = self.tableWidget_kbmControls.item(i, 0)
            if item is None:
                item = QtWidgets.QTableWidgetItem()
                self.tableWidget_kbmControls.setItem(i, 0, item)
            item.setText(key)  # Removed the _translate for simplicity

        # Reset Ammo Script table settings to default values
        for i in range(self.tableWidget_ammoScripting.rowCount()):
            for j in range(self.tableWidget_ammoScripting.columnCount()):
                comboBox = self.tableWidget_ammoScripting.cellWidget(i, j)
                if comboBox:
                    comboBox.setCurrentIndex(0)

    def setNotes(self, _translate):
        self.label_primaryHotkeyNote.setText(_translate("LLBG", "(Also works outside LLBG)"))
        
    def open_ps4_joy_map(self):
        # Create a dialog to display the image
        self.imageDialog = QtWidgets.QDialog()
        self.imageDialog.setWindowTitle("🎮 PS4 Joy Map")

        # Set window flags to remove the title bar icon
        self.imageDialog.setWindowFlags(
            QtCore.Qt.Dialog |
            QtCore.Qt.CustomizeWindowHint |
            QtCore.Qt.WindowTitleHint |
            QtCore.Qt.WindowCloseButtonHint
        )

        # Create a label to hold the image
        label = QtWidgets.QLabel(self.imageDialog)
        pixmap = QtGui.QPixmap(self.ps4joy_filePath)
        label.setPixmap(pixmap)
        label.setScaledContents(True)

        # Set the dialog size to match the image size
        self.imageDialog.setFixedSize(pixmap.size())

        # Use a layout to contain the label
        layout = QtWidgets.QVBoxLayout()
        layout.addWidget(label)
        self.imageDialog.setLayout(layout)

        # Show the image dialog
        self.imageDialog.exec_()  # Use exec_() to make the dialog modal
        
    def run_script(self):
        # Save the current directory
        original_dir = os.getcwd()

        try:
            # Convert the relative path to an absolute path
            abs_script_path = os.path.abspath(self.runLLBG_filePath)


            # Check if the script exists before attempting to run it
            if os.path.isfile(abs_script_path):
                # Change to the directory where the VBScript is located
                os.chdir(os.path.dirname(abs_script_path))

                # Execute the VBScript while setting the cwd to the script's directory
                subprocess.Popen(['cscript', '//nologo', os.path.basename(abs_script_path)], shell=True, creationflags=subprocess.CREATE_NO_WINDOW)
            else:
                error_msg = f"The script run_llbg.vbs was not found in the directory: {os.path.dirname(abs_script_path)}"
                print(error_msg)
                QtWidgets.QMessageBox.critical(None, "Error", error_msg)
        except Exception as e:
            error_msg = f"An error occurred: {e}"
            print(error_msg)
            QtWidgets.QMessageBox.critical(None, "Error", error_msg)
        finally:
            # Restore the original directory
            os.chdir(original_dir)
            
    def stop_script(self):
        # Press ahk hotkey to stop script (if running)
        pyautogui.press(self.tableWidget_scriptControls.cellWidget(1, 0).currentText())

    def list_ammo_contents(self):
        # Convert the relative path to an absolute path
        abs_file_path = os.path.abspath(self.ammoList_filePath)

        # Check if the INI file exists
        if os.path.isfile(abs_file_path):
            # Read the INI file with UTF-16 encoding
            config = ConfigParser()
            try:
                with open(abs_file_path, 'r', encoding='utf-16') as f:
                    config.read_file(f)

                # Check if 'AmmoList' section exists
                if 'AmmoList' in config:
                    ammo_list = []
                    for num, key in enumerate(config['AmmoList'], 1):
                        # Translate the number to its corresponding ammo name
                        ammo_name = self.ammo_mapping.get(config['AmmoList'][key], "Unknown Ammo")
                        ammo_list.append(f"{num}. {ammo_name}")
                    ammo_str = "\n".join(ammo_list)

                    # Show ammo list in a message box without an icon and less padding
                    self.show_custom_message("💼 Syncd Ammo List", ammo_str)
                else:
                    self.show_custom_message("⚠️ Warning", "Synchronization pending: no ammo data found.")
            except UnicodeError:
                self.show_custom_message("Error", "The ammo list file has an unsupported encoding.", critical=True)
            except ConfigParser.MissingSectionHeaderError:
                self.show_custom_message("Error", "The ammo list file is missing section headers.", critical=True)
        else:
            self.show_custom_message("⚠️ Warning", "Synchronization pending: no ammo data found.")

    def show_custom_message(self, title, message, critical=False):
        msgBox = QtWidgets.QMessageBox()
        msgBox.setWindowTitle(title)
        msgBox.setText(message)
        msgBox.setStandardButtons(QtWidgets.QMessageBox.Ok)

        # Customize window flags to remove the title bar icon
        msgBox.setWindowFlags(QtCore.Qt.Dialog | QtCore.Qt.CustomizeWindowHint | QtCore.Qt.WindowTitleHint | QtCore.Qt.WindowCloseButtonHint)

        if critical:
            msgBox.setIcon(QtWidgets.QMessageBox.Critical)
        else:
            msgBox.setIcon(QtWidgets.QMessageBox.NoIcon)

        msgBox.exec_()

            
if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    LLBG = QtWidgets.QDialog()

    ui = Ui_LLBG()
    ui.setupUi(LLBG)

    # Define a close event handler function
    def closeEvent(event):
        ui.stop_script()
        QtWidgets.QDialog.closeEvent(LLBG, event)

    # Assign the close event handler to the QDialog instance
    LLBG.closeEvent = closeEvent

    LLBG.show()
    sys.exit(app.exec_())

