@hello = private unnamed_addr constant [12 x i8] c"Hello World\00", align 1
@index = global i32 100

; Define o cabeçalho do módulo e declare a função printf externa
declare i32 @printf(ptr noundef, ...)

define i32 @main() {
    ;%index_val = load i32, i32* @index ; Load index

loop:
    ; Call printf
    call i32 (ptr, ...) @printf(ptr noundef @hello)

    ; Decrement index
    ;;%dec = add i32 %index_val, -1
    ; Store the decremented value back to index
    ;;store i32 %dec, i32* @index

    ;%cmp = icmp eq i32 %index_val, 0  ; If index is 0, exit loop
    ;br i1 %cmp, label %end, label %loop

    ;;%cmp = icmp eq i32 %dec, 0  ; Compare the decremented value
    ;;br i1 %cmp, label %end, label %loop

end:
    ret i32 0
}
