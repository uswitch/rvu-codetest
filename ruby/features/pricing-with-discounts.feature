Feature: Price plans that have a discount based on usage 
    Energy switchers want to see the cheapest energy tarrifs based on their usage

    Scenario: Find the cheapest energy plans when usage low
        Given the plans with discounts provided
        When annual usage is 1000 kwh
        Then the cheapest plans are
        | provider | plan type          | price  |
        | eon      | variable           | 108.68 |
        | edf      | fixed              | 111.25 |
        | ovo      | standard           | 120.23 |
        | bg       | standing-charge    | 121.33 |

    Scenario: Find the cheapest energy plans when usage high
        Given the plans with discounts provided
        When annual usage is 2000 kwh
        Then the cheapest plans are
        | provider | plan type          | price  |
        | edf      | fixed              | 205.75 |
        | eon      | variable           | 213.68 |
        | bg       | standing-charge    | 215.83 |
        | ovo      | standard           | 235.73 |

