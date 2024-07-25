- Read Uncommitted
Doesn’t ask for a shared lock to read data
- Read Commited
Requests a shared lock to read data which means if a writer holds an exclusive lock and a reader requests a shared lock, this request would conflict with the exclusive lock. The reader can get its shared lock once the writer commits the transaction. At that time, the reader reads only the committed changes. Another important note you have to know is that a shared lock is released as soon as a reader (transaction statement) is done not the entire transaction.
