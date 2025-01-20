@hello = private unnamed_addr constant [12 x i8] c"Hello World\00", align 1

; Define o cabeçalho do módulo e declare a função printf externa
declare i32 @printf(ptr noundef, ...)

define i32 @main() {
    ; Call printf
    call i32 (ptr, ...) @printf(ptr noundef @hello)
    ret i32 0
}
