# Contact event for one quad, on /quadx/collision. Published only when contact occurs.

std_msgs/Header header          # stamp = sim time of contact; frame_id = world
string other_id                 # Track JSON id of the obstacle or gate, or the other quad's namespace
geometry_msgs/Point position    # contact point, world [m]
geometry_msgs/Vector3 normal    # contact normal pointing toward the quad, world
float32 impact_speed            # normal relative speed at contact [m/s]
