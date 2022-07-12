       program-id. Program1 as "ArraysAlgorithms.Program1".

       data division.
       working-storage section.
      * All algorithms in this program are from "Essential Algorithms" by Rod Stephens.
      * This program builds and manipulates one-dimensional arrays.
       01 inputnum pic s9(9) value zero.
       01 topindex pic s9(9) value zero.
       01 inputnum_save pic s9(9) value zero.
       01 integer_array pic s9(9) occurs 100 times indexed by topindex.
       01 integer_array_pointer usage is pointer value is null.
       01 integer_array_length pic s9(9).
       01 integer_array_length_save pic s9(9).
       01 integer_array_length_save_2 pic s9(9).
       01 anykey pic x(80).
       01 target_integer pic s9(9).
       01 target_found pic s9(9) value zero.
       01 array_minimum pic s9(9).
       01 array_maximum pic s9(9) value zero.
       01 total pic s9(9) value zero.
       01 array_average pic s9(9) value zero.
       01 insert_value pic s9(9) value zero.
       01 insert_position pic s9(9) value zero.
       01 insert_position_save pic s9(9) value zero.
      * The first thing to do is to build an array of integers.
       procedure division.
           display "Enter number of integers".
           accept integer_array_length.
           display "Enter any key to continue".
           accept anykey.
           allocate length of integer_array_length characters loc 31 returning integer_array_pointer.
           move integer_array_length to integer_array_length_save.
           evaluate integer_array_pointer when is equal address of integer_array[0].

           move integer_array_length to integer_array_length_save_2.
           move zero to integer_array_length.
           subtract 1 from integer_array_length_save.
           perform until integer_array_length is equal to integer_array_length_save_2
               display "Enter a number"
               accept integer_array[integer_array_length]
               display "Enter any key to continue"
               accept anykey
               add 1 to integer_array_length
           end-perform.
      * Finding targets in an array
           
           display "Enter target integer".
           accept target_integer.
           display "Enter any key to continue".
           accept anykey.
           move integer_array_length_save to integer_array_length.
           perform until integer_array_length is zero
               if (integer_array[integer_array_length]) is equal to target_integer then 
                   display "Found target at" integer_array[integer_array_length];
                   display "Enter any key to continue"
                   accept anykey
                    move 1 to target_found
                   

               end-if
               subtract 1 from integer_array_length
           end-perform
           if target_found is equal to zero then
               display "Target not found"
               display "Enter any key to continue"
               accept anykey

           end-if.

      * Finding Minimum, Maximum, and Average
           move zero  to integer_array_length.
           move integer_array[0] to array_minimum.
           add 1 to integer_array_length.

           perform until integer_array_length is equal to integer_array_length_save
               if (integer_array[integer_array_length] is less than array_minimum) then
                   move integer_array[integer_array_length] to array_minimum
               end-if
               add 1 to integer_array_length
           end-perform.
           display "The minimum value in the array is " array_minimum.
           display "Emter amy key to continue".
           accept anykey.

           move zero to integer_array_length.
           move integer_array[0] to array_maximum.
           add 1 to integer_array_length.
           add 1 to integer_array_length_save.
           perform until integer_array_length is equal to integer_array_length_save
               if (integer_array[integer_array_length] is greater than array_maximum) then

                  move integer_array[integer_array_length] to array_maximum
               end-if
               add 1 to integer_array_length
           end-perform.
           display "The maximum value in the array is " array_maximum.
           display "Emter amy key to continue".
           accept anykey.

           move zero to integer_array_length.

           perform until integer_array_length is equal to integer_array_length_save
               add integer_array[integer_array_length] to total
               add 1 to integer_array_length
           end-perform.
           add 1 to integer_array_length_save.
           divide total by integer_array_length giving array_average.

           display "The average value in the array is " array_average.
           display "Emter amy key to continue".
           accept anykey.

      *       Inserting items

           display "Enter integer value to insert".
           accept insert_value.
           display "Enter any key to continue".
           accept anykey.
           display "Enter position in array of insertion".
           accept insert_position.
           display "Enter any key to continue".
           accept anykey.
           move insert_position to insert_position_save.

           move insert_position to integer_array_length.
           subtract 1 from integer_array_length.
      **  Move down the items after the target position to make room for the new item.
           perform until integer_array_length equal zero
               move integer_array[integer_array_length] to integer_array[insert_position]
               subtract 1 from insert_position
               subtract 1 from integer_array_length
           end-perform
      * Insert the new value
           move insert_value to integer_array[insert_position_save].


           goback.
           
       end program Program1.
