package transaction

import (
	"farmingcrowdfunding/campaign"
	"farmingcrowdfunding/user"
	"time"
)

type Transaction struct {
	ID         int
	CampaignID int
	UserID     int
	Amount     int
	Status     string
	Code       string
	PaymentURL string
	User       user.User         //relasi dengan tabel user
	Campaign   campaign.Campaign //relasi dengan tabel campaign
	CreatedAt  time.Time
	UpdatedAt  time.Time
}
