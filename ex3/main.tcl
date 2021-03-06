# ----------------------------------------------------------------------
#  MAIN PROGRAM - generated by the Rappture Builder
# ----------------------------------------------------------------------
package require Rappture

# open the XML file containing the run parameters
set io [Rappture::library [lindex $argv 0]]

#########################################################
# Get input values from Rappture
#########################################################

# get input value for input.integer(v1)
set v1 [$io get input.integer(v1).current]

# get input value for input.integer(v2)
set v2 [$io get input.integer(v2).current]

# get input value for input.choice(op)
set op [$io get input.choice(op).current]

#########################################################
#  Add your code here for the main body of your program
#########################################################
switch -- $op {
    Add      { set result [expr {$v1+$v2}] }
    Subtract { set result [expr {$v1-$v2}] }
    default  { error "bad value \"$op\" for Operation: should be Add or Subtract" }
}

#########################################################
# Save output values back to Rappture
#########################################################

# save output value for output.integer(result)
$io put output.integer(result).current $result


Rappture::result $io
exit 0
