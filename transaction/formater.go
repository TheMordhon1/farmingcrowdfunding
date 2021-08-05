package transaction

import "time"

type CampaignTransactionFormater struct {
	ID        int       `json:"id"`
	Name      string    `json:"name"`
	Amount    int       `json:"amount"`
	CreatedAt time.Time `json:"created_at"`
}

func FormatCampaignTransaction(transaction Transaction) CampaignTransactionFormater {
	formater := CampaignTransactionFormater{}
	formater.ID = transaction.ID
	formater.Name = transaction.User.Name
	formater.Amount = transaction.Amount
	formater.CreatedAt = transaction.CreatedAt
	return formater
}

func FormatCampaignTransactions(transactions []Transaction) []CampaignTransactionFormater {
	if len(transactions) == 0 {
		return []CampaignTransactionFormater{}
	}

	var transactionsFormater []CampaignTransactionFormater

	for _, transaction := range transactions {
		formater := FormatCampaignTransaction(transaction)
		transactionsFormater = append(transactionsFormater, formater)
	}

	return transactionsFormater
}

type UserTransactionFormater struct {
	ID        int              `json:"id"`
	Amount    int              `json:"amount"`
	Status    string           `json:"status"`
	CreatedAt time.Time        `json:"created_at"`
	Campaign  CampaignFormater `json:"campaign"`
}
type CampaignFormater struct {
	Name     string `json:"name"`
	ImageURL string `json:"image_url"`
}

func FormatUserTransaction(transaction Transaction) UserTransactionFormater {
	formater := UserTransactionFormater{}
	formater.ID = transaction.ID
	formater.Amount = transaction.Amount
	formater.Status = transaction.Status
	formater.CreatedAt = transaction.CreatedAt

	campaignFormater := CampaignFormater{}
	campaignFormater.Name = transaction.Campaign.Name
	campaignFormater.ImageURL = ""

	if len(transaction.Campaign.CampaignImages) > 0 {

		campaignFormater.ImageURL = transaction.Campaign.CampaignImages[0].FileName
	}

	formater.Campaign = campaignFormater

	return formater

}

func FormatUserTransactions(transactions []Transaction) []UserTransactionFormater {
	if len(transactions) == 0 {
		return []UserTransactionFormater{}
	}

	var transactionsFormater []UserTransactionFormater

	for _, transaction := range transactions {
		formater := FormatUserTransaction(transaction)
		transactionsFormater = append(transactionsFormater, formater)
	}

	return transactionsFormater
}
