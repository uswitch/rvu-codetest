module.exports = class EnergyMarket {

    constructor(plans) {
        this.plans = plans;
    }

    price(usage) {
        return [];
    }

    usage(supplier, planType, monthlySpend) {
        return 100;
    }
};