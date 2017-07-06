#!/bin/sh

num=$(xinput list-props $(xinput | grep TouchPad | awk '{print $6}' | cut -d = -f 2) | grep "Coordinate Transformation Matrix" | awk '{print $4}' | cut -d '(' -f 2 | cut -d ')' -f 1)
echo "This is the property value for the TouchPad of a ThinkPad: $num"
