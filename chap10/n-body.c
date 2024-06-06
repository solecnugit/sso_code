typedef struct vec_t {
    double x, y;
} vec_t;

typedef struct body_t {
    // Position vector
    vec_t position;
    // Velocity vector
    vec_t velocity;
    // Force vector
    vec_t force;
    // Mass
    double mass;
} body_t;

static vec_t vec_add(vec_t a, vec_t b) {
    vec_t sum = { a.x + b.x, a.y + b.y };
    return sum;
}

static vec_t vec_scale(vec_t v, double a) {
    vec_t scaled = { v.x * a, v.y * a };
    return scaled;
}

static double vec_lenght2(vec_t v) {
    return v.x * v.x + v.y * v.y;
}

extern vec_t calculate_force(body_t *a, body_t *b);

extern void add_force(body_t *a, vec_t b) ;

void update_positions(int nbodies, body_t *bodies,
		      double time_quantum){
    for (int i = 0; i < nbodies; ++i) {
        // Compute the new velocity of bodies[i]
	vec_t new_velocity = 
	   vec_scale(bodies[i].force, 
	             time_quantum / bodies[i].mass);
	// Update the position of bodies[i] based on
	// the average of its old and new velocity.
	bodies[i].position = 
	   vec_add(bodies[i].position,
	           vec_scale(vec_add(bodies[i].velocity,
		                     new_velocity),
			     time_quantum / 2.0));
	// Set the new velocity of bodies[i].
	bodies[i].velocity = new_velocity;
    }
}

void calculate_forces(int nbodies, body_t *bodies) {
    for (int i = 0; i < nbodies; ++i) {
	for (int j = 0; j < nbodies; ++j) {
	    if (i == j) continue;
	    add_force(&bodies[i],
		      calculate_force(&bodies[i], &bodies[j]));
	}
    }
}

void simulate(body_t *bodies, int nbodies,
	      int nsteps, int time_quantum) {
    for (int i = 0; i < nsteps; ++i) {
        calculate_forces(nbodies, bodies);
	update_positions(nbodies, bodies,
			time_quantum);
    }
}
