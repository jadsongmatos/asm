# Maquina de estados

Para gerar código assembly no formato AT&T usando LLVM, você pode seguir esses passos básicos. Essas instruções pressupõem que você já tem algum código em uma linguagem que o LLVM possa compilar (como C ou C++) e que você tenha o LLVM instalado e configurado no seu sistema.

1. **Compile seu código para LLVM IR (Intermediate Representation)**: Primeiro, você precisa compilar seu código fonte para a representação intermediária do LLVM. Isso é feito usando o frontend adequado para a sua linguagem de programação. Para C e C++, o Clang é o frontend mais comum. O comando seria algo como:

   ```sh
   clang -S -emit-llvm seu_programa.c -o seu_programa.ll
   ```

   Isso compila `seu_programa.c` para LLVM IR, gerando o arquivo `seu_programa.ll`.

2. **Gere o código assembly do LLVM IR**: Depois de ter o código em LLVM IR, você pode usar o `llc`, o compilador de backend do LLVM, para gerar código assembly no formato AT&T. O comando para fazer isso seria:

   ```sh
   llc -march=x86-64 -filetype=asm seu_programa.ll -o seu_programa.s
   ```

   Aqui, `-march=x86-64` especifica a arquitetura alvo (neste caso, x86-64), e `-filetype=asm` indica que você quer gerar código assembly. `seu_programa.ll` é o arquivo de entrada contendo LLVM IR, e `seu_programa.s` é o arquivo de saída que conterá o código assembly. Se você não especificar `-march`, o `llc` tentará inferir a arquitetura alvo a partir do ambiente.

3. **Verifique o código assembly gerado**: O arquivo `seu_programa.s` agora conterá o código assembly gerado no formato AT&T. Você pode abri-lo com qualquer editor de texto para ver o código assembly.

Se você deseja especificamente o formato AT&T (que é o padrão para algumas ferramentas no ambiente Unix), geralmente não precisa especificar opções adicionais, pois muitas ferramentas baseadas em LLVM/Clang geram assembly AT&T por padrão quando o alvo é uma arquitetura baseada em x86. No entanto, se por algum motivo o formato de saída não for o que você esperava, você pode precisar verificar as opções do seu compilador específico para forçar o formato AT&T.

Lembre-se de que as versões específicas do LLVM e do Clang podem introduzir novas opções ou depreciar outras, então é uma boa ideia consultar a documentação do LLVM para a versão que você está usando.