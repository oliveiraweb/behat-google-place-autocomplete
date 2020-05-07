<?php namespace Medology\Behat\GooglePlaceAutocomplete\Contexts;

use Behat\Behat\Context\Context;
use Behat\Mink\Exception\ExpectationException;
use Exception;
use Medology\Behat\Mink\UsesFlexibleContext;
use Medology\Spinner;

/**
 * A context for handling tests for the Gooogle Place Autocomplete Javascript script.
 */
class GooglePlaceAutocompleteContext implements Context
{
    use UsesFlexibleContext;

    /**
     * Chooses the first address in the autocomplete popup.
     *
     * @When /^(?:I |)choose the first place autocomplete option$/i
     * @throws ExpectationException If the first address is not found
     */
    public function chooseFirstOption()
    {
        /** @noinspection PhpUnhandledExceptionInspection ExpectationException is actaully thown instead */
        Spinner::waitFor(function () {
            try {
                $pac_first_item = $this->flexibleContext->getSession()->getPage()->find(
                    'css',
                    '.pac-container>.pac-item:first-child'
                );

                if (!$pac_first_item) {
                    throw new ExpectationException(
                        'Could not find the first place autocomplete item',
                        $this->flexibleContext->getSession()
                    );
                }

                $pac_first_item->click();
            } catch (Exception $e) {
                throw new ExpectationException($e->getMessage(), $this->flexibleContext->getSession());
            }
        });
    }
}
