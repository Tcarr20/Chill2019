///@description Cycle through attack buffer
if (ds_exists(attackBuffer, ds_type_queue)) {
	if (!ds_queue_empty(attackBuffer)) { 
		ds_queue_dequeue(attackBuffer);
		alarm[0] = attackBufferCycle;
	}
}