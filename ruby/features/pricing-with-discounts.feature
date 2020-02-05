@wip
Feature: Price plans that have a discount based on usage 
    Energy switchers want to see the cheapest energy tarrifs based on their usage

    Scenario: Find the cheapest energy plans when usage low
        Given the plans with discounts provided
        When annual usage is 1000 kwh
        Then the cheapest plans are
        | provider | plan type          | price  |
        | eon      | variable           | 103.43 |
        | edf      | fixed              | 99.57  |
        | ovo      | standard           | 109.73 |
        | bg       | standing-charge    | 114.96 |

    Scenario: Find the cheapest energy plans when usage high
        Given the plans with discounts provided
        When annual usage is 2000 kwh
        Then the cheapest plans are
        | provider | plan type          | price  |
        | edf      | fixed              | 184.15 |
        | eon      | variable           | 208.43 |
        | bg       | standing-charge    | 204.50 |
        | ovo      | standard           | 225.23 |

