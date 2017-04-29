// Запрет Tickets заполнять introtext

<?php
if ($modx->event->name == "OnDocFormSave") {
    if ($resource->class_key != 'Ticket') return;
    $introtext = $resource->get('introtext');
    $generateIntrotext = $resource->getIntroText($resource->get('content'), false);
    if (empty($resource->getProperty('disable_jevix'))) {
        $generateIntrotext = $resource->Jevix($generateIntrotext);
    }
    if ($introtext == $generateIntrotext) {
        $resource->set('introtext', '');
        $resource->save();
    }
}
