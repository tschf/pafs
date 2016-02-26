# PL/SQL API for Stripe

This API is used to charge cards from an APEX application. Basis usage:

```plsql
begin

    stripe_api.set_secret('[secret removed]');
    
    stripe_api.charge_card(
        p_amount => 300
      , p_source => '[token_removed]'
      , p_description => '..'
    );

end;
```
