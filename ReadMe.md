# Alpha Database ReadMe 

We are an organization/developer team who just got an assignment from a company called PetBook who wants us to help them make a new E-commerce for pets with the theme of the 90’s that's going to take on Amazon. Our job is to develop a logical model, erd-diagram and a physical model. The main purpose of the project is not to just make another E-commerce (Like there are already plenty of) because it is going to have some more functionalities. To make PetBook superior to other Ecommerce sites, we have decided to also add a feature where it’s possible for members to socialize with other animal friends, a private message feature and also the possibility to join groups! 

## Technologies
* ERD-module - Whimsical Link: https://whimsical.com/u04-alpha-er-model-E6GRnmCE6Lo4py8VDV6pTh – Was used to make a logical model
* Trello Board Link: https://trello.com/b/xcT3cGFE/agiledb-doe21 – Was used for planning our sprints and keeping track of tasks
* PgAdmin – To make a physical model
* Google Docs – Was used for documentation
* SQL

## Examples

### INSERT INTO TABLE WITH FOREIGN KEY
```
INSERT INTO public."Article"(
    supplier_id, name, stock)
    VALUES ((SELECT supplier_id from public."Supplier" WHERE supplier_id='1'), 'Leash', 7);
```

Participants: Daniel Renner, Jonna Fleischanderl, Nawras Altai, Sara Törnström & Sem Haile.