I create a deep copy of the system globals to prevent their pollution. When I am cleaned up, I simply forget the copy and the system globals will remain in their original state.

Note that copying the system globals is very expensive, so only use me where necessary.