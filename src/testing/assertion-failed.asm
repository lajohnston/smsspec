.section "smsspec.testing.assertionFailedSection" free
    smsspec.testing.assertionFailed:
        ; Set console text color to red
        ld a, %00000011
        call smsspec.console.setTextColor   ; set to a

        ld hl, (smsspec.current_describe_message_addr)
        call smsspec.console.out

        call smsspec.console.newline
        call smsspec.console.newline

        ld hl, (smsspec.current_test_message_addr)
        call smsspec.console.out

        ; Stop program
        -: jp -
.ends

.macro "assertionFailed" args message, actual
    jp smsspec.testing.assertionFailed
.endm