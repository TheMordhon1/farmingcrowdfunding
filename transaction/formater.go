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
