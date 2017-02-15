#
# Example 21-13
# Using a mutex to protect a shared resource from concurrent access.
#

# Create the mutex.

set handle [thread::mutex create]

# Copy the mutex token into a shared variable for other
# threads to access.

tsv::set db mutex $handle

# ...

# Lock the mutex before access the shared resource.

thread::mutex lock $handle

# Use shared resource, and then unlock the mutex.

thread::mutex unlock $handle

# Lather, rinse, repeat as needed...

thread::mutex destroy $handle


