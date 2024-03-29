/*
 * Copyright (C) 2011, The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/*
 * Contributed by: Giesecke & Devrient GmbH.
 */

package org.simalliance.openmobileapi.service;

import org.simalliance.openmobileapi.service.ISmartcardServiceSession;
import org.simalliance.openmobileapi.service.SmartcardError;

interface ISmartcardServiceChannel {

    /**
     * Closes the specified connection and frees internal resources.
     * A logical channel will be closed.
     */
    void close(out SmartcardError error);

    /**
     * Tells if this channel is closed.
     * 
     * @return <code>true</code> if the channel is closed, <code>false</code> otherwise.
     */
    boolean isClosed();

    /**
     * Returns a boolean telling if this channel is the basic channel.
     * 
     * @return <code>true</code> if this channel is a basic channel. <code>false</code> if
     *         this channel is a logical channel.
     */
    boolean isBasicChannel();
    
     /**
     * Returns the data as received from the application select command inclusively the status word.
     * The returned byte array contains the data bytes in the following order:
     * [<first data byte>, ..., <last data byte>, <sw1>, <sw2>]
     */
    byte[] getSelectResponse();

    /**
     * Get the session that has opened this channel.
     * 
     * @return the session object this channel is bound to.
     */
    ISmartcardServiceSession getSession();

    /**
     * Transmits the specified command APDU and returns the response APDU.
     * MANAGE channel commands are not supported.
     * Selection of applets is not supported in logical channels.
     */
    byte[] transmit(in byte[] command, out SmartcardError error);

}