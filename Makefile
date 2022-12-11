
clear:
	rm -rf target
	mkdir target

build: clear
	as -arch arm64 -o target/todo_list.o src/main.s
	cd target; ld -o todo_list todo_list.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
	chmod +x target/todo_list

run: build
	./target/todo_list