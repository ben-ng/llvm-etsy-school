@fizz_str = private unnamed_addr constant [6 x i8] c"Fizz\0A\00"
@buzz_str = private unnamed_addr constant [6 x i8] c"Buzz\0A\00"
@fizz_buzz_str = private unnamed_addr constant [10 x i8] c"FizzBuzz\0A\00"
@int_str = private unnamed_addr constant [4 x i8] c"%d\0A\00"

define i32 @main() {
  %loop_counter_ptr = alloca i32
  store i32 1, i32* %loop_counter_ptr
  br label %loop_sentinel

loop_sentinel:
  %loop_counter = load i32, i32* %loop_counter_ptr
  %cmp_result = icmp slt i32 %loop_counter, 100
  br i1 %cmp_result, label %loop_body, label %ret

loop_body:
  %mod_3_result = srem i32 %loop_counter, 3
  %mod_3_eq_0_result = icmp eq i32 %mod_3_result, 0
  br i1 %mod_3_eq_0_result, label %print_fizz, label %mod_5_check

print_fizz:
  %lol1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @fizz_str, i32 0, i32 0))
  br label %increment_loop

mod_5_check:
  %mod_5_result = srem i32 %loop_counter, 5
  %mod_5_eq_0_result = icmp eq i32 %mod_5_result, 0
  br i1 %mod_5_eq_0_result, label %print_buzz, label %mod_3_n_5_check_a

print_buzz:
  %lol2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @buzz_str, i32 0, i32 0))
  br label %increment_loop

mod_3_n_5_check_a:
  br i1 %mod_3_eq_0_result, label %mod_3_n_5_check_b, label %print_int

mod_3_n_5_check_b:
  br i1 %mod_5_eq_0_result, label %print_fizzbuzz, label %print_int

print_fizzbuzz:
  %lol3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @fizz_buzz_str, i32 0, i32 0))
  br label %increment_loop

print_int:
  %lol5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @int_str, i32 0, i32 0), i32 %loop_counter)
  br label %increment_loop

increment_loop:
  %new_loop_counter = add nsw i32 %loop_counter, 1
  store i32 %new_loop_counter, i32* %loop_counter_ptr
  br label %loop_sentinel

ret:
  ret i32 0
}

declare i32 @printf(i8*, ...)
