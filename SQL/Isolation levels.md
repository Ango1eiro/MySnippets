# Read Uncommitted
Doesn’t ask for a shared lock to read data
# Read Commited
Requests a shared lock to read data which means if a writer holds an exclusive lock and a reader requests a shared lock, this request would conflict with the exclusive lock. The reader can get its shared lock once the writer commits the transaction. At that time, the reader reads only the committed changes. Another important note you have to know is that a shared lock is released as soon as a reader (transaction statement) is done not the entire transaction.
# Repeatable Read
At this level, a reader has to request a shared lock to read data, and this reader holds this lock until the end of the entire transaction (not only the statement like the read committed) which means if a reader holds a shared lock, there is no writer can obtain an exclusive lock to update this resource until releasing the shared lock by completing the transaction.
# Serializable
At this level, a reader has to request a shared lock to read data, and this reader holds this lock until the end of the entire transaction on top of that a reader locks any row that qualifies the query’s filter which means that the reader not only locks the already existing rows but also any rows may be inserted in the future satisfy the query’s filter by another transaction.
