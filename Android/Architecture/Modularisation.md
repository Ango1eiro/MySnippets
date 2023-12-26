One way of characterizing a modular codebase would be to use the ***coupling*** and ***cohesion*** properties. Coupling measures the degree to which modules depend on each other. Cohesion, in this context, measures how the elements of a single module are functionally related. As a general rule, you should strive for low coupling and high cohesion:

***Low coupling*** means that modules should be as independent as possible from one another, so that changes to one module have zero or minimal impact on other modules. Modules shouldn't have knowledge of the inner workings of other modules.

***High cohesion*** means that modules should comprise a collection of code that acts as a system. They should have clearly defined responsibilities and stay within boundaries of certain domain knowledge. Consider a sample ebook application. It might be inappropriate to mix book and payment related code together in the same module as they are two different functional domains.
