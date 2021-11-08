from django.db import models
from base.models import BaseModel


class RestaurantTypeRolled(BaseModel):
    restaurant_type_rolled = models.ForeignKey("config.RestaurantType")
    date = models.DateField(auto_now_add=True)
    time = models.TimeField(auto_now_add=True)
    dice_roll = models.ForeignKey("dice_roll.DiceRoll")


class DiceRoll(BaseModel):
    iterations = models.PositiveBigIntegerField(default=0)
    time_in_seconds = models.PositiveBigIntegerField(default=0)
